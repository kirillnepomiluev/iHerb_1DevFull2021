

class Supplement {

  String name;
  String image;
  String analyze;
  List<String> diagnoses;
  List<String> analyzeIndicatorsCarefully;
  List<String> analyzeIndicators;

  Supplement.fromMap(Map<String, dynamic> snapshot)
      :
        name = snapshot['name'] ?? '',
        image = snapshot['image'] ?? '',
        analyze = snapshot['analyze'] ?? '',
        diagnoses = snapshot['diagnoses'] != null ? List.from(snapshot['diagnoses']) : List(),
        analyzeIndicatorsCarefully = snapshot['analyzeIndicatorsCarefully'] != null ? List.from(snapshot['analyzeIndicatorsCarefully']) : List(),
        analyzeIndicators = snapshot['analyzeIndicators'] != null ? List.from(snapshot['analyzeIndicators']) : List();


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Supplement &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          image == other.image &&
          diagnoses == other.diagnoses &&
          analyzeIndicatorsCarefully == other.analyzeIndicatorsCarefully &&
          analyzeIndicators == other.analyzeIndicators;

  @override
  int get hashCode =>
      name.hashCode ^
      image.hashCode ^
      diagnoses.hashCode ^
      analyzeIndicatorsCarefully.hashCode ^
      analyzeIndicators.hashCode;

  @override
  String toString() {
    return 'Supplement{name: $name, image: $image, diagnoses: $diagnoses, analyzeIndicatorsCarefully: $analyzeIndicatorsCarefully, analyzeIndicators: $analyzeIndicators}';
  }
}