
class Analyze {

  String name;
  String description;

  Analyze.fromMap(Map<String, dynamic> snapshot)
    :
      name = snapshot['name'] ?? '',
      description = snapshot['description'] ?? '';


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Analyze &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description;

  @override
  int get hashCode => name.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'Analyze{name: $name, description: $description}';
  }

}