
class AnalyzeIndicator {

  String name;
  int minMan;
  int minWoman;
  int maxMan;
  int maxWoman;

  AnalyzeIndicator.fromMap(Map<String, dynamic> snapshot)
      :
        name = snapshot['name'] ?? '',
        minMan = snapshot['minMan'] ?? '',
        maxMan = snapshot['maxMan'] ?? '',
        minWoman = snapshot['minWoman'] ?? '',
        maxWoman = snapshot['maxWoman'] ?? '';


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyzeIndicator &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          minMan == other.minMan &&
          minWoman == other.minWoman &&
          maxMan == other.maxMan &&
          maxWoman == other.maxWoman;

  @override
  int get hashCode =>
      name.hashCode ^
      minMan.hashCode ^
      minWoman.hashCode ^
      maxMan.hashCode ^
      maxWoman.hashCode;

  @override
  String toString() {
    return 'AnalyzeIndicator{name: $name, minMan: $minMan, minWoman: $minWoman, maxMan: $maxMan, maxnWoman: $maxWoman}';
  }
}