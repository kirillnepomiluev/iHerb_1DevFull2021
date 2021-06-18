
class Symptom {

  String name;
  List<String> analyzes;

  Symptom.fromMap(Map<String, dynamic> snapshot)
      :
        name = snapshot['name'] ?? '',
        analyzes = snapshot['analyzes'] != null ? List.from(snapshot['analyzes']) : List();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Symptom &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          analyzes == other.analyzes;

  @override
  int get hashCode => name.hashCode ^ analyzes.hashCode;

  @override
  String toString() {
    return 'Symptom{name: $name, analyzes: $analyzes}';
  }
}