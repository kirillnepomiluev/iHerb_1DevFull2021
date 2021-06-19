import 'package:flutter/material.dart';

class RecognizeScreen extends StatefulWidget {
  @override
  _RecognizeScreenState createState() => _RecognizeScreenState();
}

class _RecognizeScreenState extends State<RecognizeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ElevatedButton(
          onPressed: _pick,
          child: Text("Выбрать фотографию"),
        ),
      ],
    );
  }

  void _pick() {

  }
}
