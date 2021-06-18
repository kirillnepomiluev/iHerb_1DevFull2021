import 'package:iherb_helper/models/abstract.dart';
import 'package:meta/meta.dart';

class Condition implements WithIdTitle<String> {
  final String id;
  final String title;

  Condition({
    @required this.id,
    @required this.title,
  });

  factory Condition.fromIdAndMap(String id, Map<String, dynamic> map) {
    return Condition(
      id: id,
      title: map['title'],
    );
  }
}
