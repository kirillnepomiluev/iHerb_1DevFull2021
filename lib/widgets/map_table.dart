import 'package:flutter/material.dart';

class MapTable extends StatelessWidget {
  final Map<String, dynamic> map;

  MapTable({
    @required this.map,
  });

  @override
  Widget build(BuildContext context) {
    final keys = <Widget>[];
    final values = <Widget>[];

    for (final entry in map.entries) {
      keys.add(
        Text(
          entry.key,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
      values.add(
        Text(
          entry.value.toString(),
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
    }

    return Container(
      child: Row(
        children: [
          Column(children: keys),
          Container(width: 10),
          Column(children: values),
        ],
      ),
    );
  }
}
