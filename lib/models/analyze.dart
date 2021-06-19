
class Analyze {

  String id;
  String name;
  String description;

  Analyze.fromMap(String id, Map<String, dynamic> snapshot)
    :
      id = id,
      name = snapshot['name'] ?? '',
      description = snapshot['description'] ?? '';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Analyze &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'Analyze{id: $id, name: $name, description: $description}';
  }
}