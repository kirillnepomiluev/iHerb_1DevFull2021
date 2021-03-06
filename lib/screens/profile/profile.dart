import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iherb_helper/widgets/textFeild.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

/// экран с профилем
class _ProfileScreenState extends State<ProfileScreen> {
  DocumentSnapshot dsuser;

  Map map;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool isCheckedMen = false;
  bool isCheckedWoman = false;

  void getCurrentUser() async {
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
    BuildContext context,
    {
      String profilePhotoUrl,
      String userUID,
      String profileName = " ",
      String profileSurName = " ",
      String profileBornDate = " дата не указана",
      String profileCountry = " Город не указан",
      String profileTarget = " Цель не указана",
    }
  ) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          bannerFace(context),
          TextFieldNeo(
            hint: 'Город',
            icon: Icons.location_on_outlined,
            onChanged: (value) {},
            label: '',
          ),
          TextFieldNeo(
            hint: 'Фамилия',
            icon: Icons.location_on_outlined,
            onChanged: (value) {},
            label: '',
          ),
          TextFieldNeo(
            hint: 'Имя',
            icon: Icons.location_on_outlined,
            onChanged: (value) {},
            label: '',
          ),
          TextFieldNeo(
            hint: 'Отчество',
            icon: Icons.location_on_outlined,
            onChanged: (value) {},
            label: '',
          ),
          genderCheck(context),
          TextFieldNeo(
            hint: 'Дата рождения',
            icon: Icons.location_on_outlined,
            onChanged: (value) {},
            label: '',
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: TextFieldNeo(
              hint: 'Город',
              icon: Icons.location_on_outlined,
              onChanged: (value) {},
              label: '',
            ),
          ),
        ],
      ),
    );
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
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 2,
                  spreadRadius: 3,
                  offset: Offset(-2, -2),
                ),
              ],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                topLeft: Radius.circular(100),
              ),
            ),
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
                child: Icon(
                  Icons.add,
                  size: 50,
                  color: Color(0xFF94D065),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.fromLTRB(10, 26, 10, 10),
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width * 0.26,
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
                child: Center(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/grandMother.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget genderCheck(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 15),
      child: Row(
        children: [
          Text('Пол'),
          Expanded(child: Container()),
          NeumorphicButton(
            margin: EdgeInsets.only(right: 8),
            child: Center(child: Text('Мужской')),
            style: NeumorphicStyle(
              color: isCheckedMen ? Color(0xFF478414) : Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            onPressed: () {
              setState(() {
                isCheckedMen = true;
                isCheckedWoman = false;
              });
            },
          ),
          NeumorphicButton(
            child: Center(child: Text('Женский')),
            style: NeumorphicStyle(
              color: isCheckedWoman ? Color(0xFF478414) : Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            onPressed: () {
              setState(() {
                isCheckedMen = false;
                isCheckedWoman = true;
              });
            },
          )
        ],
      ),
    );
  }

  Widget myGradientButton(
    BuildContext context,
    {
      String text = " ",
      void Function() onPressed,
    }
  ) {
    return RaisedButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Container(
          padding: EdgeInsets.all(14),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
