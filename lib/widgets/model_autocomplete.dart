import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:iherb_helper/models/abstract.dart';
import 'package:iherb_helper/services/suggestion/abstract.dart';
import 'package:iherb_helper/widgets/text_field_decoration.dart';

import 'abstract.dart';
import 'decoration.dart';

class ModelAutocompleteWidget<T extends WithIdTitle<String>> extends StatefulWidget {
  final TextValueEditorController<T> controller;
  final int minLength;
  final ValueGetter<AbstractSuggestionService<T>> suggestionServiceBuilder;
  final BoxDecoration boxDecoration;
  final String label; // Nullable

  ModelAutocompleteWidget({
    @required this.controller,
    @required this.minLength,
    @required this.suggestionServiceBuilder,
    @required this.boxDecoration,
    this.label,
  });

  @override
  _ModelAutocompleteWidgetState<T> createState() => _ModelAutocompleteWidgetState<T>();
}

class _ModelAutocompleteWidgetState<T extends WithIdTitle<String>> extends State<ModelAutocompleteWidget<T>> {
  AbstractSuggestionService<T> _suggestionService; // late final

  @override
  void initState() {
    super.initState();
    _suggestionService = widget.suggestionServiceBuilder();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldDecorationWidget(
      label: widget.label,
      boxDecoration: widget.boxDecoration,
      child: _getTypeAheadField(),
    );
  }

  Widget _getTypeAheadField() {
    return TypeAheadField<T>(
      textFieldConfiguration: TextFieldConfiguration(
        controller: widget.controller.textEditingController,
        decoration: defaultInputDecoration,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 14,
        ),
      ),
      suggestionsCallback: _suggest,
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion.title),
        );
      },
      onSuggestionSelected: _onSuggestionSelected,
      loadingBuilder: (context) => Container(),
      noItemsFoundBuilder: _buildNoItemsFound,
    );
  }

  Future<List<T>> _suggest(String str) async {
    if (str.length < widget.minLength) return [];
    return _suggestionService.suggest(str);
  }

  void _onSuggestionSelected(T model) {
    widget.controller.setValue(model);
  }

  Widget _buildNoItemsFound(BuildContext context) {
    if (widget.controller.textEditingController.text.length < widget.minLength) {
      return Container(height: 0);
    }

    return ListTile(
      title: Text('(Not Found)'),
    );
  }
}
