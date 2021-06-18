import 'package:flutter/material.dart';
import 'package:iherb_helper/models/condition.dart';
import 'package:iherb_helper/widgets/abstract.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:iherb_helper/widgets/condition_autocomplete.dart';
import 'package:iherb_helper/widgets/textFeild.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _conditionController = WithIdTitleEditorController<String, Condition>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Поиск",
      child: ListView(
        children: [
          TextFieldNeo(label: "поиск",  hint: "поиск", onChanged: (value) {},  ),
          ConditionAutocompleteWidget(
            label: "Condition",
            controller: _conditionController,
            //boxDecoration: boxDecoration,
          ),
        ],
      ),
      index: 2,
    );
  }
}


