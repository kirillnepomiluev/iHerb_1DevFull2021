import 'package:flutter/material.dart';
import 'package:iherb_helper/screens/AnalyzeScreen.dart';
import 'package:iherb_helper/screens/suggested_items/suggested_items.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:iherb_helper/widgets/green_button.dart';
import 'package:iherb_helper/widgets/map_table.dart';

/// Экран с отсканированными результатами аназила
class AnalysisResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Результат анализа",
      child: _getContent(context),
      index: tabSearch,
    );
  }

  /// основной виджет экрана
  Widget _getContent(BuildContext context) {
    return Column(
      children: [
        MapTable(map: recognized),
        Container(height: 20),
        _getLackWidget(),
        Container(height: 20),
        _getSuggestionsButton(context),
      ],
    );
  }

  /// Возвращает наиболее заниженный показатель.
  String _getLack() {
    if (recognized.isEmpty) return null;

    // TODO: сравнивать с нормами.
    return recognized.keys.last;
  }

  Widget _getLackWidget() {
    final lack = _getLack();
    if (lack == null) {
      return Text(
        "Всё в норме",
        style: TextStyle(fontSize: 20),
      );
    }

    return Text(
      "Недостаток " + lack,
      style: TextStyle(fontSize: 20),
    );
  }

  /// кнопка Рекомендации
  Widget _getSuggestionsButton(BuildContext context) {
    final lack = _getLack();
    if (lack == null) return Container();
    return GreenButton(
      text: "Рекоммендации",
      onPressed: () => _showRecommendedItems(context),
    );
  }

  /// показать рекомендации
  void _showRecommendedItems(BuildContext context) {
    final lack = _getLack();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SuggestedItemsScreen(
          component: lack,
        ),
      ),
    );
  }
}
