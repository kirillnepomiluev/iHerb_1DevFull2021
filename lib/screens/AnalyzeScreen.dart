import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:iherb_helper/models/analyze.dart';
import 'package:iherb_helper/models/analyzeIndicator.dart';
import 'package:iherb_helper/screens/analysis_result/analysis_result.dart';
import 'package:iherb_helper/utils/cameraPreviewScanner.dart';
import 'package:iherb_helper/utils/textDetectorPainter.dart';
import 'package:iherb_helper/utils/utils.dart' as utils;
import 'package:iherb_helper/utils/scannerUtils.dart' as scannerUtils;
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:iherb_helper/themes/themes.dart' as themes;
import 'package:flutter/foundation.dart';
import 'package:iherb_helper/widgets/map_table.dart';

final recognized = <String, double>{};

class AnalyzeScreen extends StatefulWidget {

  Analyze _analyze;

  AnalyzeScreen(this._analyze);

  @override
  _AnalyzeScreenState createState() => _AnalyzeScreenState(_analyze);

}

class _AnalyzeScreenState extends State<AnalyzeScreen> {

  _AnalyzeScreenState(this._analyze);

  bool _load = false;
  bool _recognitionProcess = false;
  Analyze _analyze;
  FirebaseFirestore store = FirebaseFirestore.instance;
  List<AnalyzeIndicator> _indicators = [];
  CameraDescription _cameraDescription;
  CameraController _camera;

  @override
  void initState() {

    getIndicators();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    debugPrint("Analyzeee" + _analyze.toString());
    return AppScaffold(
      title: _analyze.name,
      child: _load ? utils.loadindWidget() : utils.standartPadding(
          Column(
            children : [
              Text(
                _analyze.description,
                style: Theme.of(context).textTheme.headline3,
              ),
              utils.topBottomPadding(
                Text(
                    "Загрузите результаты анализов, чтобы мы смогли подобрать для вас полезные БАДы",
                    style: Theme.of(context).textTheme.headline5),
              ),
              utils.standartPadding(
                  Container(
                    height: 60,
                    width: 150,
                    child: NeumorphicButton(
                      onPressed: () => _scan(context),
                      child: Text(
                        "Загрузка анализов",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      style: NeumorphicStyle(

                      ),
                    ),
                  )
              ),
              MapTable(
                map: recognized,
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: _indicators.length,
              //     itemBuilder: (context, i) {
              //       return Text(_indicators.elementAt(i).name);
              //     },
              //   ),
              // )
            ] ,
          )
      ),
      index: 2,
    );
  }

  void _scan(BuildContext context) async {
    recognized.clear();

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CameraPreviewScanner(
          recognized: recognized,
          camera: _camera,
        ),
      ),
    );

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AnalysisResultScreen(),
      ),
    );
    // setState(() {
    // });
  }

  void getIndicators() async {

    setState(() {
      _load = true;
    });

    List<AnalyzeIndicator> indicators = [];
    CameraLensDirection _direction = CameraLensDirection.back;
    CameraDescription cameraDescription =  await scannerUtils.ScannerUtils.getCamera(_direction);
    setState(() {
      _cameraDescription = cameraDescription;
      _camera = CameraController(
        _cameraDescription,
        defaultTargetPlatform == TargetPlatform.iOS
            ? ResolutionPreset.low
            : ResolutionPreset.medium,
        enableAudio: false,
      );
    });

    await store
        .collection("analyzeIndicators")
        .where("analyzeId", isEqualTo: _analyze.id)
        .get()
        .then((value) => value.docs
        .forEach((element) => indicators.add(AnalyzeIndicator.fromMap(element.data()))));

    debugPrint("indicators" + indicators.toString());

    setState(() {
      _indicators = indicators;
      _load = false;
    });

  }

  Widget _buildResults(VisionText scanResults) {
    CustomPainter painter;
    // print(scanResults);
    if (scanResults != null) {
      final Size imageSize = Size(
        _camera.value.previewSize.height - 100,
        _camera.value.previewSize.width,
      );
      painter = TextDetectorPainter(imageSize, scanResults);
     // getWords(scanResults);

      return CustomPaint(
        painter: painter,
      );
    } else {
      return Container();
    }
  }

  Map<String, num> analyzeData = {
    "42JImJmfX3vQ8oQIaIuh" : 140,
    "8Vm0AX9zpoGMw1MG6X76" : 37.1,
    "SbiFvvqnWRbEzULqLU9r" : 3.1,
    "Z9ehq3FV1uSxYW4FZsiA" : 70,
    "yeSr6kVtkGgtk2frrrsN" : 1,
  };

}