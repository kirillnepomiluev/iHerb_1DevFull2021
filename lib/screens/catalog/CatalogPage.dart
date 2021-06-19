import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:iherb_helper/themes/colors.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iherb_helper/widgets/textFeild.dart';

import '../settingsPage.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: profileContentColumn(context),
      title: "Пищевые добавки",
      index: 2,
      actionsBasket: true,
    );
  }

  Widget profileContentColumn(
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
            TextFieldNeo(
              label: "поиск",
              hint: "поиск",
              onChanged: (value) {},
            ),
            bannerPosition(context),
            bannerPosition(context,color: salat_Light),
            bannerPosition(context,color: rozov_Light),
            bannerPosition(context),
            bannerPosition(context),
            bannerPosition(context),
          ]),
    );
  }

  Widget bannerPosition(BuildContext context,
      {
      Color color = orange_Light,
      String section = 'Витамины, Микроэлементы',
      String name = 'California Gold Nutrition Immune 4, ',
      String description =
          'средство для укрепления иммунитета, 180 вегетарианских капсул'}) {
    return Stack(
      children: [
        Container(
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
          padding: EdgeInsets.fromLTRB(32, 17, 22, 15),
          child: Row(
            children: [
              Container(
                height: 138,
                width: 60,
                margin: EdgeInsets.only(left: 0, right: 15),
                child: Image.asset('assets/position.png'),
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
                      margin: EdgeInsets.only(top: 7,bottom: 7),
                      child: Text(name,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              color: Color(0xFF2E2E2E))),
                    ),
                    Text(description,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Color(0xFF2E2E2E)))
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 48,
          right: 22,
          child: Container(
            height: 42,
            width: 24,
            child: Image.asset('assets/ReitCircle.png'),),
        )
      ],
    );
  }

  Widget myGradientButton(BuildContext context,
      {String btnText = " ", void Function() funk}) {
    return RaisedButton(
      onPressed: funk,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: const BoxDecoration(
          color: Colors.blue,
          //     colors: <Color>[btngradientstartlight, btngradientendlight]),
          // gradient: LinearGradient(
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Container(
          padding: EdgeInsets.all(14),
//        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0, maxWidth: 123),
          // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            btnText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
