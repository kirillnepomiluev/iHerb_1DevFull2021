import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iherb_helper/models/supplement.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:iherb_helper/widgets/supplment_list_view.dart';

/// Подборщик БАДов по витанинам
class SuggestedItemsScreen extends StatelessWidget {
  final String component;

  SuggestedItemsScreen({
    @required this.component,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Рекомендации при недостатке " + component,
      child: StreamBuilder(
        stream: _getStream(),
        builder: (context, snapshot) => _buildWithSnapshot(snapshot.data),
      ),
      index: 1,
    );
  }

  Stream<QuerySnapshot> _getStream() {
    return FirebaseFirestore.instance
        .collection("supplements")
        .where("vitamins", arrayContains: component)
        .snapshots();
  }

  Widget _buildWithSnapshot(QuerySnapshot snapshot) {
    final supplements = <Supplement>[];

    for (final doc in snapshot?.docs ?? []) {
      supplements.add(
        Supplement.fromMap(doc.data()),
      );
    }

    return SupplementsListView(supplements: supplements);
  }
}
