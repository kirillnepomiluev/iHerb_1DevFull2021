import 'package:meta/meta.dart';

abstract class WithId<T> {
  T get id;
}

class WithIdTitle<T> implements WithId<T> {
  final T id;
  final String title;

  const WithIdTitle({
    @required this.id,
    @required this.title,
  });
}
