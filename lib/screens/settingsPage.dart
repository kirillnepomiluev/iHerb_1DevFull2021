import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb_helper/themes/custom_theme.dart';
import 'package:iherb_helper/themes/themes.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';

import '../main.dart';



class SettingPage extends StatefulWidget {
  bool fromTitle;
  SettingPage ({this.fromTitle = false});
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController dbUrlController = TextEditingController();
  @override
  void initState() {
    // dbUrlController.text = dbURL;
    super.initState();
  }

  void _changeTheme(BuildContext buildContext, {MyThemeKeys key}) {
    if (CustomTheme.instanceOf(buildContext).mythemeKey == MyThemeKeys.LIGHTFC)
      CustomTheme.instanceOf(buildContext).changeTheme(MyThemeKeys.DARKFC);
    else CustomTheme.instanceOf(buildContext).changeTheme(MyThemeKeys.LIGHTFC);
  }
  @override
  Widget build(BuildContext context) {

    return AppScaffold(child: bodySetting(context),title: 'Настройки', index: 2,);

  }
  Widget bodySetting (BuildContext context){
    return Center (
      child: Container(
        width: 400,
        child: ListView(
          children: <Widget>[
            SettingListTile( func:(){
              _changeTheme(context);
              prefs.setBool("isDarkTeme", CustomTheme.instanceOf(context).mythemeKey == MyThemeKeys.DARKFC);
              isDarkTheme = CustomTheme.instanceOf(context).mythemeKey == MyThemeKeys.DARKFC;
            }, text: "Темная тема",
              value: CustomTheme.instanceOf(context).mythemeKey == MyThemeKeys.DARKFC,),
          ],
        ),
      ),
    );
  }
}

class _SettingListTileState extends State<SettingListTile> {
  Widget settingsLineWiget(BuildContext context) {
    return FlatButton(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(flex: 5,
                child: Text(widget.text
                    ,style: TextStyle(
                      fontSize: 20,
// color: Color(0xFFFFFFFF),
                    )),),
              Expanded(flex: 1,
                  child: CupertinoSwitch( activeColor: Theme.of(context).accentColor, value: widget.value, onChanged: (bool _value) {
                    setState(() {
                      widget.value = _value;
                    });
                    widget.func();
                  },)),
            ],
          ),
          Divider(),
        ],
      ),
      onPressed: () {
        setState(() {
          widget.value = !widget.value;
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return settingsLineWiget (context);
  }
}

class SettingListTile extends StatefulWidget {
  String text;
  bool value;
  Function () func;
  SettingListTile ({Key key, this.text, this.value = false, this.func}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _SettingListTileState();
  }
}