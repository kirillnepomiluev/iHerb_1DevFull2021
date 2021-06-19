
import 'analyze.dart';
import 'analyzeIndicator.dart';

/// Результат анализа
class AnalyzeResult {

  Analyze analyze;
  List<AnalyzeIndicator> analyzeIndicators;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyzeResult &&
          runtimeType == other.runtimeType &&
          analyze == other.analyze &&
          analyzeIndicators == other.analyzeIndicators;

  @override
  int get hashCode => analyze.hashCode ^ analyzeIndicators.hashCode;

  @override
  String toString() {
    return 'AnalyzeResult{analyze: $analyze, analyzeIndicators: $analyzeIndicators}';
  }
}