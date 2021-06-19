import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:iherb_helper/themes/colors.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iherb_helper/widgets/textFeild.dart';

import '../dialog.dart';
import '../settingsPage.dart';


/// экран каталога
class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {

  bool ischeck  = false;

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
      // actionsBasket: true,
    );
  }

  /// столбец с профилем
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
            bannerPosition(context, color: salat_Light),
            bannerPosition(context, color: rozov_Light),
            bannerPosition(context),
            bannerPosition(context),
            bannerPosition(context),
          ]),
    );
  }

  /// Виджет с товаром
  Widget bannerPosition(BuildContext context,
      {Color color = orange_Light,
      String section = 'Витамины, Микроэлементы',
      String name = 'California Gold Nutrition Immune 4, ',
      String description =
          'средство для укрепления иммунитета, 180 вегетарианских капсул'}) {
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context) => showPosition(context));
      },
      child: Stack(
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
                        margin: EdgeInsets.only(top: 7, bottom: 7),
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
              child: Image.asset('assets/ReitCircle.png'),
            ),
          )
        ],
      ),
    );
  }

  /// Виджет кнопки
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

  /// часть виджета карточки товара
  Widget oneEl(BuildContext context,{Color color,String image,String name}) {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(16),boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 4,
          blurRadius: 5,
          offset: Offset(4, 2), // changes position of shadow
        ),
      ],),
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.symmetric(vertical: 25,horizontal: 35),
      child:           Container(
        margin: EdgeInsets.only(bottom: 7),
        height: 58,
        width: 58,
        child: Image.asset(image),
      ),
    );
  }


  /// виджет карточки товара
  Widget showPosition(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32))),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.only(top: 40),
      child: ListView(
        children: [
          Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container(margin: EdgeInsets.only(left: 24),child: Text('California Gold Nutrition Superfoods, органический порошок спирулины, 240 г (8,5 унции)',style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: Color(0xFF2E2E2E))))),
                    Container(margin: EdgeInsets.only(left: 10,right: 24),child: Text('Водоросли',style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        color: Color(0xFF478414)))),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 96,
                      width: 74,
                      child: Image.asset('assets/oneEticetca.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15),
                      height: 133,
                      width: 100,
                      child: Image.asset('assets/twoEticetca.png'),
                    ),
                    Container(
                      height: 96,
                      width: 74,
                      child: Image.asset('assets/threeEticetca.png'),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                color: Color(0xFFE3FCE9),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(margin: EdgeInsets.only(bottom: 10),child: Text('Кальций',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: Color(0xFF478414)),)),
                        Text('12%',style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            color: Color(0xFF478414))),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25,right: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(margin: EdgeInsets.only(bottom: 10),child: Text('Фосфор',                      style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: Color(0xFF478414)))),
                          Text('0.83%',style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Roboto',
                              fontSize: 24,
                              color: Color(0xFF478414))),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(margin: EdgeInsets.only(bottom: 10),child: Text('Калий',                      style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: Color(0xFF478414)))),
                        Text('1.4%',style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            color: Color(0xFF478414))),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(margin: EdgeInsets.only(bottom: 10),child: Text('Магний',                      style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: Color(0xFF478414)))),
                          Text('0.37%',                      style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Roboto',
                              fontSize: 24,
                              color: Color(0xFF478414))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(24, 20, 24, 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('Описание',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 22,
                          color: Color(0xFF000000))),
                      Icon(Icons.arrow_forward_ios,size: 20,)
                    ],),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text('Наша органическая спирулина, соответствующая стандартам Фармакопеи США (USP), поставляется компанией Parry Nutraceuticals...',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Color(0xFF000000))),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 24, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Совместимость',style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 22,
                        color: Color(0xFF000000))),
                    Container(
                      height: 70,
                      margin: EdgeInsets.only(top: 10),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          oneEl(context,image: 'assets/buton.png',color: Color(0XffE3FCE9)),
                          oneEl(context,image: 'assets/buton.png',color: Color(0XffFFF5DE)),
                          oneEl(context,image: 'assets/buton.png',color: Color(0XffFFEEEA)),
                          oneEl(context,image: 'assets/buton.png',color: Color(0XffE3FCE9)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: (){
                    showDialog(context: context, builder: (BuildContext context) => show1BAsket(context));
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                    child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        height: 56,
                        width: 247,
                        child: Center(
                            child: Text('В КОРЗИНУ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'Roboto',
                                    fontSize: 24,
                                    color: Colors.white)))),
                  ),
                ),
              )
            ],
          ),
    ),
        ],
      ),);
  }

  /// виджет корзины
  Widget show1BAsket(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.only(top: MediaQuery
          .of(context)
          .size
          .height * 0.5),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                Text('Для кого вы заказываете', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: Colors.black)),
                Text(
                    'Superfoods, органический порошок спирулины, 240 г (8,5 унции)?',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: Colors.black)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                listTileForDialogName(context),
                listTileForDialogName(context),
                listTileForDialogName(context),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      showDialog(context: context, builder: (BuildContext context) => showReceptionTime(context));
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                      child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          height: 56,
                          width: 247,
                          child: Center(
                              child: Text('ВЫБРАТЬ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Roboto',
                                      fontSize: 24,
                                      color: Colors.white)))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),);
  }

  /// виджет графика приема препарата
  Widget showReceptionTime(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.only(top: MediaQuery
          .of(context)
          .size
          .height * 0.6),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                Text('Время для приема:', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: Colors.black)),
                Text(
                    'Superfoods, органический порошок спирулины, 240 г (8,5 унции)!',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: Colors.black)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context) => CatalogScreen());
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 56,
                      width: 140,
                      child: Center(
                          child: Text('позже',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 24,
                                  color: Colors.white)))),
                ),
              ),
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context) => showReceptionTime2(context));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 56,
                      width: 140,
                      child: Center(
                          child: Text('принял',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 22,
                                  color: Colors.white)))),
                ),
              ),
            ],
          ),
        ],
      ),);
  }

  /// второй виджет графика приема препарата
  Widget showReceptionTime2(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.only(top: MediaQuery
          .of(context)
          .size
          .height * 0.3),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                Text('Время для приема:', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: Colors.black)),
                Text(
                    'Superfoods, органический порошок спирулины, 240 г (8,5 унции)!',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: Colors.black)),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              listTileForDialogTime(context),
              listTileForDialogTime(context),
              listTileForDialogTime(context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context) => showReceptionTime(context));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 56,
                      width: 140,
                      child: Center(
                          child: Text('отмена',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 22,
                                  color: Colors.white)))),
                ),
              ),
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context) => showReceptionRecommendations(context));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 56,
                      width: 140,
                      child: Center(
                          child: Text('выбор',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 24,
                                  color: Colors.white)))),
                ),
              ),
            ],
          )
        ],
      ),);
  }

  /// виджет рекомендаций
  Widget showReceptionRecommendations(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.only(top: MediaQuery
          .of(context)
          .size
          .height * 0.6),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                Text('Рекомендуем', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: Colors.black)),
                Text(
                    'сдать повторно общий анализ крови для отслеживания изменений и загрузить анализы в ваш кабинет!',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: Colors.black)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context) => CatalogScreen());
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 56,
                      width: 140,
                      child: Center(
                          child: Text('позже',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  color: Colors.white)))),
                ),
              ),
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context) => showReceptionRecommendations2(context));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 56,
                      width: 140,
                      child: Center(
                          child: Text('Загрузить',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  color: Colors.white)))),
                ),
              ),
            ],
          ),
        ],
      ),);
  }

  /// второй виджет рекомендаций
  Widget showReceptionRecommendations2(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.only(top: MediaQuery
          .of(context)
          .size
          .height * 0.3),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                Text('Рекомендуем', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: Colors.black)),
                Text(
                    'сдать повторно общий анализ крови для отслеживания изменений и загрузить анализы в ваш кабинет!',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: Colors.black)),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              listTileForDialogTime2(context),
              listTileForDialogTime2(context),
              listTileForDialogTime2(context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context) => CatalogScreen());
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 56,
                      width: 140,
                      child: Center(
                          child: Text('Отмена',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  color: Colors.white)))),
                ),
              ),
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context) => showStocks(context));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 56,
                      width: 140,
                      child: Center(
                          child: Text('Выбор',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  color: Colors.white)))),
                ),
              ),
            ],
          ),
        ],
      ),);
  }

  /// показать рекомендации
  Widget showStocks(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.only(top: MediaQuery
          .of(context)
          .size
          .height * 0.6),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                Text('Рекомендуем', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: Colors.black)),
                Text(
                    'сдатОльга, Superfoods, органический порошок спирулины, 240 г (8,5 унции) почти закончился :(Хотите приобрести?',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: Colors.black)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context) => CatalogScreen());
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 56,
                      width: 140,
                      child: Center(
                          child: Text('позже',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Colors.white)))),
                ),
              ),
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context) => showReceptionRecommendations2(context));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 56,
                      width: 140,
                      child: Center(
                          child: Text('Приобрести',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: Colors.white)))),
                ),
              ),
            ],
          ),
        ],
      ),);
  }




  /// показать диалоговое окно с профилем
  Widget listTileForDialogName(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFF5FAFD), width: 1))),
      child: ListTile(
        onTap: (){
          setState(() {
            ischeck = !ischeck;
          });
        },
        trailing: Neumorphic(
          child: Container(height: 20, width: 20, decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white
          ),
            child: ischeck ? Center(
              child: Container(height: 15, width: 15, decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFF478414)
              ),
              ),
            ) : Container(),
          ),
        ),
        leading: Image.asset('assets/grandMother.png'),
        title: Column(children: [
          Text('Ольга Луценко', style: TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontFamily: 'Roboto',
              fontSize: 16,
              color: Colors.black)),
          Text('35 лет, ж', style: TextStyle(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              fontFamily: 'Roboto',
              fontSize: 12,
              color: Colors.black)),
        ],),
      ),
    );
  }

  /// показать диалоговое окно с временем приема
  Widget listTileForDialogTime(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFF5FAFD), width: 1))),
      child: ListTile(
        onTap: (){
          setState(() {
            ischeck = !ischeck;
          });
        },
        trailing: Neumorphic(
          child: Container(height: 20, width: 20, decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white
          ),
            child: ischeck ? Center(
              child: Container(height: 15, width: 15, decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFF478414)
              ),
              ),
            ) : Container(),
          ),
        ),
        // leading: Image.asset('assets/grandMother.png'),
        title:           Text('Через 30 мин', style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: 'Roboto',
            fontSize: 16,
            color: Colors.black)),
      ),
    );
  }

  /// показать второе диалоговое окно с временем приема
  Widget listTileForDialogTime2(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFF5FAFD), width: 1))),
      child: ListTile(
        onTap: (){
          setState(() {
            ischeck = !ischeck;
          });
        },
        trailing: Neumorphic(
          child: Container(height: 20, width: 20, decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white
          ),
            child: ischeck ? Center(
              child: Container(height: 15, width: 15, decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFF478414)
              ),
              ),
            ) : Container(),
          ),
        ),
        // leading: Image.asset('assets/grandMother.png'),
        title: Text('Завтра', style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: 'Roboto',
            fontSize: 16,
            color: Colors.black)),
      ),
    );
  }

}
