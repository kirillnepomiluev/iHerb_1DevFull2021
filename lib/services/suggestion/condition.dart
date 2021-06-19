import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iherb_helper/models/condition.dart';

import 'firebase.dart';

/// реализация полнотекстового поиска
class ConditionSuggestionService extends FirestoreSuggestionService<Condition> {
  static const _collectionName = 'conditions';

  @override
  Condition denormalizeObject(String id, Map<String, dynamic> map) => Condition.fromIdAndMap(id, map);

  @override
  Query getAllQuery() {
    return FirebaseFirestore.instance
        .collection(_collectionName)
    ;
  }

  @override
  Query orderAll(Query query) {
    return query.orderBy('score', descending: true);
  }

  @override
  Query orderMatches(Query query) {
    return query.orderBy('score', descending: true);
  }
}
