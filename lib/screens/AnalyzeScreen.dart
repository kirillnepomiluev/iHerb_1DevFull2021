import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:iherb_helper/models/analyze.dart';
import 'package:iherb_helper/models/analyzeIndicator.dart';
import 'package:iherb_helper/models/supplement.dart';
import 'package:iherb_helper/utils/cameraPreviewScanner.dart';
import 'package:iherb_helper/utils/textDetectorPainter.dart';
import 'package:iherb_helper/utils/utils.dart' as utils;
import 'package:iherb_helper/utils/scannerUtils.dart' as scannerUtils;
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:iherb_helper/themes/themes.dart' as themes;
import 'package:flutter/foundation.dart';

class AnalyzeScreen extends StatefulWidget {

  Analyze _analyze;
  bool _recognitionProcess;

  AnalyzeScreen(this._analyze, this._recognitionProcess);

  @override
  _AnalyzeScreenState createState() => _AnalyzeScreenState(_analyze, _recognitionProcess);

}

class _AnalyzeScreenState extends State<AnalyzeScreen> {

  _AnalyzeScreenState(this._analyze, this._recognitionProcess);

  bool _load = false;
  bool _recognitionProcess = false;
  Analyze _analyze;
  FirebaseFirestore store = FirebaseFirestore.instance;
  List<Supplement> _supplements = [];
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
                style: Theme.of(context).textTheme.bodyText2,
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
                      onPressed: () {
                        setState(() {
                          _recognitionProcess = true;
                        });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CameraPreviewScanner(_camera, _analyze),
                          ),
                        );
                      },
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
              _recognitionProcess ? utils.topBottomPadding(Text("Продукты на основании ваших анализов:", style: Theme.of(context).textTheme.headline5)) : Container(),
              _recognitionProcess ? Expanded(
                child: ListView.builder(
             /*     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                  ), */
                  itemCount: _supplements.length,
                  itemBuilder: (context, i) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                          child: Image.network(
                              _supplements.elementAt(i).image,
                              width: 90.0,
                              height: 90.0,
                              fit: BoxFit.fill),
                        ),
                        Expanded(child: Text(_supplements.elementAt(i).name)),
                      ],
                    );
                  },
                ),
              ) : Container()
            ] ,
          )
      ),
      index: 2,
    );
  }


  void getIndicators() async {

    setState(() {
      _load = true;
    });

    List<Supplement> supplements = [];
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
        .collection("supplements")
        .where("analyze", isEqualTo: _analyze.id)
        .get()
        .then((value) => value.docs
        .forEach((element) => supplements.add(Supplement.fromMap(element.data()))));


    debugPrint("indicators" + supplements.toString());

    setState(() {
      _supplements = supplements;
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