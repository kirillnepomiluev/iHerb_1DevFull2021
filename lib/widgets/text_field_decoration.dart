import 'package:flutter/material.dart';

class TextFieldDecorationWidget extends StatelessWidget {
  final BoxDecoration boxDecoration;
  final Widget child;
  final String label; // Nullable

  TextFieldDecorationWidget({
    @required this.boxDecoration,
    @required this.child,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getLabelWidget(),
            child,
          ],
        ),
      ),
    );
  }

  Widget _getLabelWidget() {
    if (label == null) return Container();

    return Container(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xFFA0A0A0),
        ),
      ),
    );
  }
}
