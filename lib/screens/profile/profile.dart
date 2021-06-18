import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      title: "Profile",
      index: 2,
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
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    // FirebaseAuth.instance.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()),);
                  },
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.settings,
                          size: 40.0,
                          color: Theme.of(context)
                              .tabBarTheme
                              .unselectedLabelColor))),
              GestureDetector(
                  onTap: () {
                    // FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, "/signin");
                  },
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.exit_to_app,
                          size: 40.0,
                          color: Theme.of(context)
                              .tabBarTheme
                              .unselectedLabelColor)))
            ],
          ),
          GestureDetector(
            onTap: () {
              // uploadUserAvatar(userUID, isolate);
            },
            child: Container(
              margin: EdgeInsets.all(20),
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  image: AssetImage(
                      'assets/uuu.jpg'),
                  // image: FirebaseImage(profilePhotoUrl, shouldCache: false),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 18),
            child: new Text(
              map['name'] != null ? map['name'] : "не указано",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Row(
            //строка с Фи
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(profileName),
              Text(profileSurName),
            ],
          ),
          Row(
            //строка с датой рождения
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: new Text(
                  profileBornDate,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
          //город
          Container(
            child: new Text(
              profileCountry,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Container(
            child: new Text(
              profileTarget,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(child: Container()),
          new Container(
            height: 50,
            margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
            // padding: EdgeInsets.all(24),
            child:
                myGradientButton(context, btnText: "Редактировать", funk: () {
              Navigator.pushNamed(context, "/editprofile");
            }),
          )
        ]);
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
