import 'package:flutter/material.dart';
import 'package:iherb_helper/themes/custom_theme.dart';
import 'package:iherb_helper/themes/themes.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

bool isDarkTheme;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Цель: Снижение веса",
      child: Container(),
    );
  }
}
