import 'dart:async';

import 'package:iherb_helper/models/abstract.dart';

typedef FutureOr<Iterable<T>> SuggestionsCallback<T>(String pattern);

/// Абстрактный сервис выпадающих предложений при поиске
abstract class AbstractSuggestionService<T extends WithId<String>> {
  Future<List<T>> suggest(String str);
}
