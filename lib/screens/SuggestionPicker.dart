import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iherb_helper/models/analyze.dart';
import 'package:iherb_helper/models/symptom.dart';
import 'package:iherb_helper/screens/AnalyzeScreen.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:iherb_helper/utils/utils.dart' as utils;

class SuggestionPicker extends StatefulWidget {
  @override
  _SuggestionPickerState createState() => _SuggestionPickerState();
}

class _SuggestionPickerState extends State<SuggestionPicker> {
  bool _load = false;
  FirebaseFirestore store = FirebaseFirestore.instance;
  List<Symptom> _symptoms = [];

  @override
  void initState() {
    getSymptoms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Выберите симптом",
      child: _load ? utils.loadingWidget() : Container(
        child: new ListView.builder(
          itemCount: _symptoms.length,
          itemBuilder: (context, i) {
            return new ExpansionTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text(
                    _symptoms[i].name,
                    style: new TextStyle(
                      color: Color(0xFF478414),
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  new Text(
                    "Нажмите, чтобы посмотреть рекомендуемые анализы",
                    style: new TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'Roboto',
                      color: Color(0xFF2E2E2E),
                    ),
                  )
                ],
              ),
              children: <Widget>[
                new Column(
                  children: _buildExpandableContent(_symptoms[i]),
                ),
              ],
            );
          },
        ),
      ),
      index: 2,
    );
  }

  List<Widget> _buildExpandableContent(Symptom symptom) {
    List<Widget> columnContent = [];

    symptom.analyzesList.forEach((element) {
      columnContent.add(
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AnalyzeScreen(element),
              ),
            );
          },
          child: new ListTile(
            title: Text(
              element.name,
              style: new TextStyle(
                fontSize: 18.0,
                fontFamily: 'Roboto',
                color: Color(0xFF478414),
              ),
            ),
          ),
        ),
      );
    });

    return columnContent;
  }

  void getSymptoms() async {
    setState(() {
      _load = true;
    });
    List<Symptom> symptoms = [];
    List<Analyze> analyzes = [];

    await store
        .collection("symptoms")
        .get()
        .then((value) => value.docs
          .forEach((element) => symptoms.add(Symptom.fromMap(element.data()))));

    await store.collection("analyze")
        .get()
        .then((value) => value.docs
        .forEach((element) => analyzes.add(Analyze.fromMap(element.id, element.data()))));

    symptoms.forEach((element) {
      element.analyzes.forEach((analyzesId) {
        Analyze a = analyzes.firstWhere((element) => element.id == analyzesId);
        element.analyzesList.add(a);
      });
    });

    debugPrint("symptoms" + symptoms.toString());

    setState(() {
      _symptoms = symptoms;
      _load = false;
    });
  }
}
