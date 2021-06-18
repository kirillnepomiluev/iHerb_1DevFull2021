import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iherb_helper/screens/BasketPage.dart';
import 'package:iherb_helper/screens/profile/profile.dart';
import 'package:iherb_helper/screens/search/search.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final index;
  AppScaffold({
    @required this.title,
    @required this.child,
    @required this.index
  });
  List <IconData> iconList = [Icons.bar_chart,  Icons.search, Icons.account_box, Icons.shopping_basket];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: child,
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: index,
        gapLocation: GapLocation.center,
        elevation: 12,
        notchSmoothness: NotchSmoothness.sharpEdge,
        leftCornerRadius: 15,
        rightCornerRadius: 15,
        height: 70,
        onTap: (index) =>  _onTabTap(context, index)
      ,
        //other params
      ),
    );
  }

  void _onTabTap(BuildContext context, int index) {
    switch (index) {
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
            builder: (context) => ProfileScreen(),
          ),
        );
        break;
        case tabBasket:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BasketPage(),
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
