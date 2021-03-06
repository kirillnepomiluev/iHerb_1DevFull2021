import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iherb_helper/screens/BasketPage.dart';
import 'package:iherb_helper/screens/SuggestionPicker.dart';
import 'package:iherb_helper/screens/catalog/CatalogPage.dart';
import 'package:iherb_helper/screens/lifestyle/LifeStylePage.dart';
import 'package:iherb_helper/screens/profile/profile.dart';
import 'package:iherb_helper/screens/search/search.dart';

import '../icons.dart';

/// каркас UI приложения
class AppScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final index;
  final bool actionsBasket;

  AppScaffold(
      {@required this.title, @required this.child, @required this.index, this.actionsBasket = false});

  List<IconData> iconList = [
    MyFlutterApp.ic_home,
    MyFlutterApp.ic_analyz,
    MyFlutterApp.ic_food,
    MyFlutterApp.ic_profile,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: 'Roboto',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        actions: [
          actionsBasket ? IconButton(icon: Icon(Icons.shopping_basket_outlined,size: 28,color: Colors.black,), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BasketPage(),));}) : Container(),
        ],
        backgroundColor: Color(0xFFF5FCFD),
      ),
      body: child,
      backgroundColor: Color(0xFFF5FCFD),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF478414),
        child: Container(
          margin: EdgeInsets.all(15),
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.fill,
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogScreen(),));
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.white,
        icons: iconList,
        inactiveColor: Color(0xFF999999),
        activeIndex: index,
        gapLocation: GapLocation.center,
        elevation: 16,
        notchSmoothness: NotchSmoothness.sharpEdge,
        leftCornerRadius: 15,
        rightCornerRadius: 15,
        height: MediaQuery.of(context).size.height * 0.13,
        onTap: (index) => _onTabTap(context, index),
      ),
    );
  }

  void _onTabTap(BuildContext context, int index) {
    switch (index) {
      case tabProgress:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SuggestionPicker(),
          ),
        );
        break;
      case tabSearch:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SearchScreen(),
          ),
        );
        break;
      case tabProfile:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LifeStyleScreen(),
          ),
        );
        break;
      case tabBasket:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );
        break;
    }
  }
}

const tabProgress = 0;
const tabSearch = 1;
const tabProfile = 2;
const tabBasket = 3;
