import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iherb_helper/models/abstract.dart';
import 'package:iherb_helper/utils/utils.dart';

import 'abstract.dart';

typedef FutureOr<Iterable<T>> SuggestionsCallback<T>(String pattern);

abstract class FirestoreSuggestionService<T extends WithIdTitle<String>> extends AbstractSuggestionService<T> {
  Future<List<T>> suggest(String str) {
    return (str == '')
        ? _suggestFirstOfAll()
        : _suggestMatches(str);
  }

  Future<List<T>> _suggestFirstOfAll() async {
    final querySnapshot = await orderAll(getAllQuery())
        .limit(10)
        .get();

    return denormalizeSnapshots(querySnapshot);
  }

  Future<List<T>> _suggestMatches(String str) async {
    final terms = textToSearchTerms(str);

    //final querySnapshot = await FirebaseFirestore.instance.collection('conditions').where('keywords', arrayContains: terms[0]).get();
    final querySnapshot = await orderMatches(getAllQuery().where('keywords', arrayContains: terms[0]))
        .limit(10)
        .get();

    return denormalizeSnapshots(querySnapshot);
  }

  List<T> denormalizeSnapshots(QuerySnapshot querySnapshot) {
    final models = <T>[];

    for (final docSnapshot in querySnapshot.docs) {
      models.add(
        denormalizeObject(
          docSnapshot.id,
          docSnapshot.data(),
        ),
      );
    }

    return models;
  }

  Query getAllQuery();
  T denormalizeObject(String id, Map<String, dynamic> map);

  /// Override to sort.
  Query orderAll(Query query) {
    return query.orderBy('title');
  }

  /// Override to sort.
  Query orderMatches(Query query) {
    return query;
  }
}
