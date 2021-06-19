import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: keys,
          ),
          Container(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: values,
          ),
        ],
      ),
    );
  }
}
