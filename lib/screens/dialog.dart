import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

/// показать корзину
Widget showCart(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    backgroundColor: Colors.white,
    insetPadding: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.5,
    ),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                'Для кого вы заказываете',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              Text(
                'Superfoods, органический порошок спирулины, 240 г (8,5 унции)?',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              listTile(context),
              listTile(context),
              listTile(context),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget listTile(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Color(0xFFF5FAFD), width: 1)),
    ),
    child: ListTile(
      trailing: GestureDetector(
        onTap: (){
          // TODO
        },
        child: Neumorphic(
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: Center(
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFF478414),
                ),
              ),
            ),
          ),
        ),
      ),
      leading: Image.asset('assets/grandMother.png'),
      title: Column(
        children: [
          Text(
            'Ольга Луценко',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontFamily: 'Roboto',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            '35 лет, ж',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              fontFamily: 'Roboto',
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget showPosition(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
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
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 24),
                        child: Text('California Gold Nutrition Superfoods, органический порошок спирулины, 240 г (8,5 унции)',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Color(0xFF2E2E2E),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 24),
                      child: Text(
                        'Водоросли',
                        style: TextStyle(
                        fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: Color(0xFF478414),
                        ),
                      ),
                    ),
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
                    ),
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
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Кальций',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: Color(0xFF478414),
                            ),
                          ),
                        ),
                        Text(
                          '12%',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            color: Color(0xFF478414),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25,right: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Фосфор',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                color: Color(0xFF478414),
                              ),
                            ),
                          ),
                          Text(
                            '0.83%',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Roboto',
                              fontSize: 24,
                              color: Color(0xFF478414),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Калий',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: Color(0xFF478414),
                            ),
                          ),
                        ),
                        Text(
                          '1.4%',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            color: Color(0xFF478414),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Магний',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                color: Color(0xFF478414),
                              ),
                            ),
                          ),
                          Text(
                            '0.37%',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Roboto',
                              fontSize: 24,
                              color: Color(0xFF478414),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                        Text(
                          'Описание',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 22,
                            color: Color(0xFF000000),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 20),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Наша органическая спирулина, соответствующая стандартам Фармакопеи США (USP), поставляется компанией Parry Nutraceuticals...',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 24, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Совместимость',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 22,
                        color: Color(0xFF000000),
                      ),
                    ),
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
                    showDialog(context: context, builder: (BuildContext context) => showCart(context));
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 7, 14, 8),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),color: Color(0xFF478414)),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 56,
                      width: 247,
                      child: Center(
                        child: Text(
                          'В КОРЗИНУ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget oneEl(BuildContext context,{Color color,String image,String name}) {
  return Container(
    height: 64,
    width: 64,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 4,
          blurRadius: 5,
          offset: Offset(4, 2), // changes position of shadow
        ),
      ],
    ),
    margin: EdgeInsets.only(right: 20),
    padding: EdgeInsets.symmetric(vertical: 25,horizontal: 35),
    child: Container(
      margin: EdgeInsets.only(bottom: 7),
      height: 58,
      width: 58,
      child: Image.asset(image),
    ),
  );
}
