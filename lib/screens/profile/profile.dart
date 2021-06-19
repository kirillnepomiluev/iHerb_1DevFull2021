import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iherb_helper/widgets/textFeild.dart';

import '../settingsPage.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Isolate isolate;

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String photoURL;

  DocumentSnapshot dsuser;

  Map map;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void getCurrentUser() async {
    // FirebaseUser _user = await _firebaseAuth.currentUser();
    FirebaseFirestore.instance
        .collection("users")
        .doc("NjJrmXCopAGttbkKame2")
        .get()
        .then((value) {
      setState(() {
        dsuser = value;
        map = dsuser.data();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: profileContentColumn(context),
      title: "Профиль",
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
    return Column(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          bannerFace(context),
          TextFieldNeo(hint: 'Город',icon: Icons.location_on_outlined,onChanged: (value){},label: '',),
          TextFieldNeo(hint: 'Фамилия',icon: Icons.location_on_outlined,onChanged: (value){},label: '',),
          TextFieldNeo(hint: 'Имя',icon: Icons.location_on_outlined,onChanged: (value){},label: '',),
          TextFieldNeo(hint: 'Отчество',icon: Icons.location_on_outlined,onChanged: (value){},label: '',),
          TextFieldNeo(hint: 'Дата рождения',icon: Icons.location_on_outlined,onChanged: (value){},label: '',),
          TextFieldNeo(hint: 'Город',icon: Icons.location_on_outlined,onChanged: (value){},label: '',),
        ]);
  }

  Widget bannerFace(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height * 0.17,
          width: MediaQuery.of(context).size.width * 1,
          child: Image.asset(
            "assets/FonForFaceProfile.png",
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.fromLTRB(10, 26, 10, 10),
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width * 0.26,
            decoration: BoxDecoration(
                color: Color(0xFFF5FCFD),
                boxShadow: [
                  BoxShadow()
                ],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    topLeft: Radius.circular(100))),
            child: Center(
              child: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/grandMother.png'),
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 150,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
                  child: Icon(Icons.add,size: 50,color: Color(0xFF94D065),)),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.fromLTRB(10, 26, 10, 10),
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width * 0.26,
                // decoration: BoxDecoration(
                //     color: Color(0xFFF5FCFD),
                //     borderRadius: BorderRadius.only(
                //         topRight: Radius.circular(100),
                //         topLeft: Radius.circular(100))),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 55,
                    backgroundImage: AssetImage('assets/grandMother.png'),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.fromLTRB(10, 26, 10, 10),
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width * 0.26,
                // decoration: BoxDecoration(
                //     color: Color(0xFFF5FCFD),
                //     borderRadius: BorderRadius.only(
                //         topRight: Radius.circular(100),
                //         topLeft: Radius.circular(100))),
                child: Center(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/grandMother.png'),
                  ),
                ),
              )
            ],
          ),
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
