import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  GreenButton({
    @required this.text,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: 56,
          width: 247,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontFamily: 'Roboto',
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
