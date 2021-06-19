import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TextFieldNeo extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;

  final ValueChanged<String> onChanged;

  TextFieldNeo(
      {@required this.label, @required this.hint, this.onChanged, this.icon});

  @override
  _TextFieldNeoState createState() => _TextFieldNeoState();
}

class _TextFieldNeoState extends State<TextFieldNeo> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.hint);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: Text(
            this.widget.label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: NeumorphicTheme.defaultTextColor(context),
            ),
          ),
        ),
        Neumorphic(
          margin: EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
          style: NeumorphicStyle(
            color: Color(0xFFF5FCFD),
            depth: NeumorphicTheme.embossDepth(context),
            boxShape: NeumorphicBoxShape.stadium(),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          child: Row(
            children: [
              Container(
                height:15,
                width: 15,
                child: Icon(
                  this.widget.icon,
                  color: Color(0xFF999999),
                ),
              ),
              TextField(
                onChanged: this.widget.onChanged,
                controller: _controller,
                decoration:
                    InputDecoration.collapsed(hintText: this.widget.hint),
              ),
            ],
          ),
        )
      ],
    );
  }
}
