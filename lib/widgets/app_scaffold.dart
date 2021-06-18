import 'package:flutter/material.dart';
import 'package:iherb_helper/screens/BasketPage.dart';
import 'package:iherb_helper/screens/profile/profile.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  AppScaffold({
    @required this.title,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: "Прогресс",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Поиск",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Профиль",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: "Корзина",
          )
        ],
        onTap: (index) => _onTabTap(context, index),
      ),
    );
  }

  void _onTabTap(BuildContext context, int index) {
    switch (index) {
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
