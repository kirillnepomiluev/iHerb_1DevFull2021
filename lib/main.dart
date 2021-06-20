import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iherb_helper/themes/custom_theme.dart';
import 'package:iherb_helper/themes/themes.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// точка входа в приложение

String versoinApp = "1.0.0 от 18.06.2021";

SharedPreferences prefs;
Map<String, dynamic> curUser;
FirebaseFirestore store = FirebaseFirestore.instance;
User currentUser = FirebaseAuth.instance.currentUser;
Map<String, Object> userData;
Map<String, Object> homeData;
bool statusStartWork = false;
bool isDarkTheme;
bool test = false;
bool showDialogShiftOpen = false;
double distanceToHome = 0;
double minRange = 100;
double minRangeToOrder = 100;

const String mapRoute = '/map';
DateTime dateTime;
Timer globalTimer;
TextEditingController taskPageTextController = TextEditingController(text: "ok");


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferences.getInstance().then((value) {
    prefs = value;
    if (prefs != null && prefs.get("isDarkTeme") != null) {
      isDarkTheme = prefs.get("isDarkTeme");
    }
  });
  // initializeServiceLocator();

  isDarkTheme = isDarkTheme == null ? false : isDarkTheme;
  initializeDateFormatting().then((_) => runApp(
    CustomTheme(
      initialThemeKey:
      isDarkTheme ? MyThemeKeys.DARKFC : MyThemeKeys.LIGHTFC,
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iHerb',
      theme: CustomTheme.of(context),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Цель: Снижение веса",
      child: Container(),
      index: 0,
    );
  }
}
