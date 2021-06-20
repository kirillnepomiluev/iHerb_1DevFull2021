import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iherb_helper/widgets/map_table.dart';

import 'detectorPainters.dart';
import 'scannerUtils.dart';

/// Сканнер результатов анализов с помощью камеры
/// Пример для проверки: https://helix.ru/catalog/downloadexamplefile/?hxid=06-228
class CameraPreviewScanner extends StatefulWidget {
  final Map<String, double> recognized;

  CameraPreviewScanner({
    @required this.recognized,
    @required this.camera,
  }) : super(
    key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
  );

  CameraController camera;

  @override
  State<StatefulWidget> createState() => _CameraPreviewScannerState(camera);
}

class _CameraPreviewScannerState extends State<CameraPreviewScanner> {
  // TODO: Брать список на распознание из БД.
  final _terms = ['B1', 'B2', 'B3', 'B5', 'B6'];
  final _regExpsLeft = <String, RegExp>{};
  final _numberRegExp = RegExp('\\s(\\d+(\\.\\d+)?)\\s');

  _CameraPreviewScannerState(this._camera);
  dynamic _scanResults;
  CameraController _camera;
  Detector _currentDetector = Detector.text;
  bool _isDetecting = false;

  final TextRecognizer _recognizer = FirebaseVision.instance.textRecognizer();

  @override
  void initState() {
    super.initState();
    _initializeRegExps();
    _initializeCamera();
  }

  void _initializeRegExps() {
    for (final term in _terms) {
      _regExpsLeft[term] = RegExp('\\s' + term + '\\s');
    }
  }

  Future<void> _initializeCamera() async {
    await _camera.initialize();
    await _camera.startImageStream((CameraImage image) {
      if (_isDetecting) return;

      _isDetecting = true;

      ScannerUtils.detect(
        image: image,
        detectInImage: _getDetectionMethod(),
        imageRotation: _camera.description.sensorOrientation,
      ).then(
            (dynamic results) {
          if (!mounted) return;
          setState(() {
            _onResult(results);
            _scanResults = results;
          });
        },
      ).whenComplete(() => _isDetecting = false);
    });
  }

  /// Вызывается на каждом кадре, получает распознанный текст.
  void _onResult(VisionText visionText) {
    final toTest = ' ' + visionText.text + ' ';

    // Перебираем все поля, для которых ещё не нашли значения.
    for (final entry in _regExpsLeft.entries) {
      final term = entry.key;
      if (widget.recognized.containsKey(term)) continue;
      final regExp = entry.value;

      final match = regExp.firstMatch(toTest);
      if (match == null) continue;

      // Распознали название показателя.
      // Ищем любое число, которое следует за названием.

      final end = match.end;
      final tail = toTest.substring(end);
      final valueMatch = _numberRegExp.firstMatch(tail);
      if (valueMatch == null) continue;

      final stringValue = valueMatch.group(1);

      final value = double.tryParse(stringValue);
      if (value == null) continue;

      // Да, это число. Сохраняем.
      // TODO: Сравнить с нормой. При существенном отклоннени продолжать сканировать. Вероятна ошибка.
      widget.recognized[term] = value;
    }
  }

  Future<dynamic> Function(FirebaseVisionImage image)  _getDetectionMethod() {
    switch (_currentDetector) {
      case Detector.text:
        return _recognizer.processImage;
      default:
        return null;
    }
  }

  Widget _buildResults() {
    const Text noResultsText = Text('No results!');

    if (_scanResults == null ||
        _camera == null ||
        !_camera.value.isInitialized) {
      return noResultsText;
    }

    CustomPainter painter;

    final Size imageSize = Size(
      _camera.value.previewSize.height,
      _camera.value.previewSize.width,
    );

    if (_scanResults is! VisionText) return noResultsText;
    painter = TextDetectorPainter(imageSize, _scanResults);

    return CustomPaint(
      painter: painter,
    );
  }

  Widget _buildImage() {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: _camera == null
          ? const Center(
        child: Text(
          'Initializing Camera...',
          style: TextStyle(
            color: Colors.green,
            fontSize: 30,
          ),
        ),
      )
          : Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CameraPreview(_camera),
          _buildResults(),
          Positioned(
            child: _getRecognizedContainer(),
            left: 30,
            bottom: 30,
          ),
        ],
      ),
    );
  }

  Widget _getRecognizedContainer() {
    return Container(
      padding: EdgeInsets.all(100),
      color: Color(0x80000000),
      child: _getRecognizedTable(),
    );
  }

  Widget _getRecognizedTable() {
    if (widget.recognized.isEmpty) {
      return Text(
        'Ничего не распознано.',
        style: TextStyle(fontSize: 20),
      );
    }

    return MapTable(map: widget.recognized);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Наведите на лист результатов анализа'),
      ),
      body: _buildImage(),
    );
  }

  @override
  void dispose() {
    // TODO: Проверить порядок освобождния ресурсов.
    // _camera.dispose().then((_) {
    //   _recognizer.close();
    // });

    super.dispose();
  }
}
