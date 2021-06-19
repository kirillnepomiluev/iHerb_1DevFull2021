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

Widget standartPadding(Widget widget) {
  return Padding(
    padding: EdgeInsets.all(5.0),
    child: widget,
  );
}

Widget topBottomPadding(Widget widget) {
  return Padding(
    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
    child: widget,
  );
}