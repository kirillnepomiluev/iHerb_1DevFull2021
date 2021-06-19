import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iherb_helper/widgets/map_table.dart';

import 'detectorPainters.dart';
import 'scannerUtils.dart';

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
  final _terms = ['B1', 'B2', 'B3', 'B5', 'B6'];
  final _regExpsLeft = <String, RegExp>{};
  //final _recognized = <String, double>{};
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

  void _onResult(VisionText visionText) {
//print('RECOGNIZED: ' + visionText.text);
    final toTest = ' ' + visionText.text + ' ';

    for (final entry in _regExpsLeft.entries) {
      final term = entry.key;
      if (widget.recognized.containsKey(term)) continue;
      final regExp = entry.value;

      if (toTest.contains(term)) {
        final a = 1;
      }

      final match = regExp.firstMatch(toTest);
      if (match == null) continue;

      final end = match.end;
      final tail = toTest.substring(end);
//print('TAIL: ' + tail);
      final valueMatch = _numberRegExp.firstMatch(tail);
      if (valueMatch == null) continue;

      final stringValue = valueMatch.group(1);
//print('FOUND ' + term + ' ' + tail.substring(valueMatch.start, valueMatch.end));
print('FOUND ' + term + ' ' + stringValue);

      final value = double.tryParse(stringValue);
      if (value == null) continue;

      widget.recognized[term] = value;
    }
    // for (final textBlock in visionText.blocks) {
    //   final toTest = ' ' + textBlock.text + ' ';
    //
    //   for (final regExp in _regExpsLeft) {
    //     final match = regExp.firstMatch(toTest);
    //     if (match == null) continue;
    //
    //     if (match.)
    //   }
    // }
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
          //_buildResults(),
          Positioned(
            //child: MapTable(map: _recognized),
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
//    _recognizer.close();
    // _camera.dispose().then((_) {
    //   _barcodeDetector.close();
    //   _faceDetector.close();
    //   _imageLabeler.close();
    //   _cloudImageLabeler.close();
    //   _recognizer.close();
    //   _cloudRecognizer.close();
    // });

    super.dispose();
  }
}