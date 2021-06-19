import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:iherb_helper/models/condition.dart';
import 'package:iherb_helper/themes/colors.dart';
import 'package:iherb_helper/widgets/abstract.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:iherb_helper/widgets/condition_autocomplete.dart';
import 'package:iherb_helper/widgets/textFeild.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

/// виджет поиска
class _SearchScreenState extends State<SearchScreen> {
  final _conditionController = WithIdTitleEditorController<String, Condition>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Поиск",
      child: ListView(
        children: [
          TextFieldNeo(label: "поиск", hint: "поиск", onChanged: (value) {},),
          ConditionAutocompleteWidget(
            label: "Condition",
            controller: _conditionController,
            //boxDecoration: boxDecoration,
          ),
          TopBanner(context),
          Container(
            margin: EdgeInsets.only(left: 24,top: 0,bottom: 15),
            child: Text('Ставьте цели',
                style: TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontFamily: 'Roboto',
                fontSize: 20,
                color: Colors.black)),
          ),
          BottomBanner(context)
        ],
      ),
      index: 2,
    );
  }

  Widget TopBanner(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFFFF5DE),borderRadius: BorderRadius.circular(32),boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 4,
          blurRadius: 5,
          offset: Offset(4, 5), // changes position of shadow
        ),
      ],),
      margin: EdgeInsets.fromLTRB(24, 24, 24, 48),
      padding: EdgeInsets.fromLTRB(32, 17, 22, 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ВСЕЙ СЕМЬЕ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Roboto',
                      fontSize: 10,
                      color: green_Light)),
              Text('Добавляйте своих близких',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: Colors.black)),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Color(0xFF478414)),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    height: 32,
                    child: Center(
                        child: Text('Регистрация',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Colors.white)))),
              )
            ],),
          Container(
            height: 138,
            width: 60,
            margin: EdgeInsets.only(left:23),
            child: Image.asset('assets/family.png'),
          ),
        ],
      ),
     );
  }

  Widget BottomBanner(BuildContext context) {
    return Container(
      height: 149,
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.only(left: 24,right: 20),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          oneEl(context,color: Color(0xFFE3FCE9),image: 'assets/ic_sport.png',name: 'Спорт'),
          oneEl(context,color: Color(0xFFFFF5DE),image: 'assets/Group.png',name: 'Работа'),
          oneEl(context,color: Color(0xFFFFE9E4),image: 'assets/ic_slimming.png',name: 'Похудение'),
      ],),
    );
  }

  Widget oneEl(BuildContext context,{Color color,String image,String name}) {
    return Container(
      height: 147,
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(32),boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 4,
          blurRadius: 5,
          offset: Offset(4, 2), // changes position of shadow
        ),
      ],),
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.symmetric(vertical: 25,horizontal: 35),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 7),
            height: 58,
            width: 58,
            child: Image.asset(image),
          ),
          Text(name,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: Colors.black))
        ],
      ),
    );
  }

}


