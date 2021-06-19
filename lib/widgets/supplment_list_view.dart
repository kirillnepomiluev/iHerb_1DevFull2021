import 'package:flutter/material.dart';
import 'package:iherb_helper/models/supplement.dart';

class SupplementsListView extends StatelessWidget {
  final List<Supplement> supplements;

  SupplementsListView({
    @required this.supplements,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
 /*     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
      ), */
      itemCount: supplements.length,
      itemBuilder: (context, i) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
              child: Image.network(
                supplements.elementAt(i).image,
                width: 90.0,
                height: 90.0,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(child: Text(supplements.elementAt(i).name)),
          ],
        );
      },
    );
  }
}
