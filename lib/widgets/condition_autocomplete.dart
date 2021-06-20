import 'package:flutter/material.dart';
import 'package:iherb_helper/models/condition.dart';
import 'package:iherb_helper/services/suggestion/condition.dart';

import 'abstract.dart';
import 'model_autocomplete.dart';

/// Виджет автозаполнения болезни
class ConditionAutocompleteWidget extends StatelessWidget {
  final String label;
  final WithIdTitleEditorController<String, Condition> controller;
  final BoxDecoration boxDecoration;

  ConditionAutocompleteWidget({
    @required this.label,
    @required this.controller,
    @required this.boxDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return ModelAutocompleteWidget(
      label: label,
      controller: controller,
      minLength: 0,
      suggestionServiceBuilder: () => ConditionSuggestionService(),
      boxDecoration: boxDecoration,
    );
  }
}
