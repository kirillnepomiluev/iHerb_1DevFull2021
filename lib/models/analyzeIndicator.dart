/// Индикатор анализа с референсными значениями
class AnalyzeIndicator {
  String name;
  String analyzeId;
  num minMan;
  num minWoman;
  num maxMan;
  num maxWoman;

  AnalyzeIndicator.fromMap(Map<String, dynamic> snapshot)
      :
        name = snapshot['name'] ?? '',
        analyzeId = snapshot['analyzeId'] ?? '',
        minMan = snapshot['minMan'] ?? 0,
        maxMan = snapshot['maxMan'] ?? 0,
        minWoman = snapshot['minWoman'] ?? 0,
        maxWoman = snapshot['maxWoman'] ?? 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyzeIndicator &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          analyzeId == other.analyzeId &&
          minMan == other.minMan &&
          minWoman == other.minWoman &&
          maxMan == other.maxMan &&
          maxWoman == other.maxWoman;

  @override
  int get hashCode =>
      name.hashCode ^
      analyzeId.hashCode ^
      minMan.hashCode ^
      minWoman.hashCode ^
      maxMan.hashCode ^
      maxWoman.hashCode;

  @override
  String toString() {
    return 'AnalyzeIndicator{name: $name, analyzeId: $analyzeId, minMan: $minMan, minWoman: $minWoman, maxMan: $maxMan, maxWoman: $maxWoman}';
  }
}
