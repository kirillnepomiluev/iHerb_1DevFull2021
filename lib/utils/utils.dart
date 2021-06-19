import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> textToSearchTerms(String text) {
  return text.trim().toLowerCase().split(RegExp(r'\s+'));
}

Widget loadindWidget() {
  return Center(
    child: new Container(
      width: 70.0,
      height: 70.0,
        child: new Padding(
        padding: const EdgeInsets.all(5.0),
        child: new Center(
          child: new CircularProgressIndicator()
            )
          ),
       ),
      );
    }
