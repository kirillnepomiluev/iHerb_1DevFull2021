import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:iherb_helper/themes/colors.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iherb_helper/widgets/textFeild.dart';

import '../settingsPage.dart';

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
            _bannerFace(context,color: Color(0xFFE3FCE9)),
            _bannerFace(context,color: Color(0xFFE3FCE9)),
            _bannerFace(context,color: Color(0xFFE3FCE9)),
            _bannerFace(context,color: Color(0xFFE3FCE9)),
          ]),
    );
  }

  Widget _bannerFace(BuildContext context,{Color color = orange_Light,
    String section = 'Сон',
    String name = '03:00 - 07:20',
    String index = '4 ч. 20 мин.',
    String conclusion = 'Стал хуже 53%',
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
              child: Image.asset('assets/IconTimeSleep.png'),
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
                          color: Color(0xFF478414))),
                  Container(
                    margin: EdgeInsets.only(top: 7, bottom: 7),
                    child: Text(name,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            color: Color(0xFF2E2E2E))),
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
                        color: Color(0xFF478414))),
                Container(
                  margin: EdgeInsets.only(top: 7, bottom: 7),
                  child: Text(conclusion,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: Color(0xFF2E2E2E))),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }

}