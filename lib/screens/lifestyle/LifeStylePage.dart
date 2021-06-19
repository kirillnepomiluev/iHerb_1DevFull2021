import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:iherb_helper/themes/colors.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iherb_helper/widgets/textFeild.dart';

import '../settingsPage.dart';

/// Экран "Стиль жизни"
class LifeStyleScreen extends StatefulWidget {
  @override
  _LifeStyleScreenState createState() => _LifeStyleScreenState();
}

class _LifeStyleScreenState extends State<LifeStyleScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: LifeStyleContentColumn(context),
      title: "Стиль жизни",
      index: 2,

    );
  }

  Widget LifeStyleContentColumn(
      BuildContext context, {
        String profilePhotoUrl,
        String userUID,
        String profileName = " ",
        String profileSurName = " ",
        String profileBornDate = " дата не указана",
        String profileCountry = " Город не указан",
        String profileTarget = " Цель не указана",
      }) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _bannerFace2(context,
                color: Color(0xFFE3FCE9),
                asset: 'assets/IconTimeSleep.png',
                section: 'Сон',
                sectionColor: Color(0xFF478414),
                index: '80 уд./мин.',
                conclusion: "Стал хуже на 53%",
                conclusionColor: Color(0xFFFB575A),
                name: '03:00 - 07:20',
            ),
            _bannerFace2(context,
                color: red_Light,
                asset: 'assets/IconCheck.png',
              section: 'Пульс',
              sectionColor: Color(0xFFFB575A),
              index: '80 уд./мин.',
              conclusion: "Стал лучше на 20%",
              conclusionColor: Color(0xFF478414),
              nameAsset: 'assets/Vector.png'
            ),
            _bannerFace2(context,
                color: yellow_light,
                asset: 'assets/IconCheck2.png',
                section: 'Шаги',
                sectionColor: Color(0xFFFB575A),
                index: '6000 из 10000',
                conclusion: "Стало хуже на 10%",
                conclusionColor: Color(0xFFFB575A),
                nameAsset: 'assets/Group24.png'
            ),
            _bannerFace2(context,
                color: blue_light,
                asset: 'assets/IconCheck3.png',
                section: 'Спорт',
                sectionColor: Color(0xFFFB575A),
                index: '20 мин.',
                conclusion: "Стало лучше на 10%",
                conclusionColor:  Color(0xFF478414),
                nameAsset: 'assets/addSport.png'
            ),
          ]),
    );
  }

  /// основная информация экрана
  Widget _bannerFace2(BuildContext context,{Color color = orange_Light,
    String section = 'Сон',
    Color sectionColor,
    String name,
    String nameAsset,
    String index,
    String conclusion = 'Стал хуже 53%',
    Color conclusionColor,
    String asset
  }) {
    return GestureDetector(
      onTap: (){
        // showDialog(context: context, builder: (BuildContext context) => showPosition(context));
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(4, 5), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
        padding: EdgeInsets.fromLTRB(24, 24, 20, 20),
        child: Row(
          children: [
            Container(
              height: 32,
              width: 32,
              margin: EdgeInsets.only(left: 0, right: 15),
              child: Image.asset(asset),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(section,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: sectionColor)),
                  Container(
                    margin: EdgeInsets.only(top: 7, bottom: 7),
                    child: name != null ?
                    Text(name,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            color: Color(0xFF2E2E2E))) :
                    Image.asset(nameAsset),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(index,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: Colors.black)),
                Container(
                  margin: EdgeInsets.only(top: 7, bottom: 7),
                  child: Text(conclusion,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: conclusionColor)),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }

}