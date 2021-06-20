
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:iherb_helper/screens/catalog/CatalogPage.dart';
import 'package:iherb_helper/themes/colors.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';

/// экран корзины
class BasketPage extends StatefulWidget {
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  bool ischeck = false;
  bool warning = false;
  bool checkValue = false;
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String promocode = "";
  bool isPromocodeUsed = false;
  // List<PromoPriceElement> promoPrices = new List();
  int summ;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(title: 'Корзина', child:basket(context), index: 3,
    );
  }

  /// Виджет с товаром
  Widget bannerPosition(BuildContext context,
      {Color color = orange_Light,
        // List<String> vitamins,
        String section = 'Витамины, Микроэлементы',
        bool checkbox = false,
        String name = 'California Gold Nutrition Immune 4, ',
        String image = 'assets/position.png',
        String price = '₽792.51',
        String description =
        'средство для укрепления иммунитета, 180 вегетарианских капсул'}) {
    return GestureDetector(
      onTap: (){
        // showDialog(context: context, builder: (BuildContext context) => showPosition(context,name,image,checkbox));
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
                  height: 80,
                  width: 60,
                  margin: EdgeInsets.only(left: 0, right: 15),
                  child: Card(elevation: 9,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)) ,child: Image(image: NetworkImage(image),)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(section,
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.w600,
                      //         fontStyle: FontStyle.normal,
                      //         fontFamily: 'Roboto',
                      //         fontSize: 12,
                      //         color: Color(0xFF478414))),
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
                              color: Color(0xFF2E2E2E))),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(child: Text(price,                          style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                color: Color(0xFFBE4543)))),
                            Row(
                              children: [
                                Icon(Icons.star,color: Color(0xFFFDC600),size: 15,),
                                Container(margin: EdgeInsets.only(left: 7,right: 7),child: Icon(Icons.star,color: Color(0xFFFDC600),size: 15,)),
                                Icon(Icons.star,color: Color(0xFFFDC600),size: 15,),
                                Container(margin: EdgeInsets.only(left: 7,right: 7),child: Icon(Icons.star,color: Color(0xFFFDC600),size: 15,)),
                                Icon(Icons.star,color: Color(0xFFFDC600),size: 15,),
                              ],
                            ),
                          ],
                        ),
                      ),
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

  Widget basket(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomPadding: false,
        body: Column(
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection("basket")
                // .orderBy('time', descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  QuerySnapshot querySnapshot = snapshot.data;
                  int itemCount = querySnapshot.docs.length;
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: itemCount,
                        itemBuilder: (BuildContext context, index) {
                          if(querySnapshot.docs[index]['name'] == 'Now Foods, C-1000, 250 таблеток' ) {
                            setState(() {
                              warning = true;
                            });
                          }
                          return bannerPosition(context,name: querySnapshot.docs[index]['name'],color: salat_Light,image: querySnapshot.docs[index]['image']);
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      height: 100,
                      width: 100,
                      child: Text(
                        "Ошибка",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }
                  return Container(
                    child: CircularProgressIndicator(),
                  );
                }),
            Container(
              color: Color(0xFFEEF8FE),
              height: 220,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Color(0xffF2F3F5),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          margin: EdgeInsets.only(right: 8, left: 13, top: 18, bottom: 30),
                          // height: 44,
                          child: Form(
                            key: _formKey,
                            child: new TextFormField(
                              // controller:  controller,
                              decoration: new InputDecoration(
                                fillColor: Color(0xffF2F3F5),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 12),
                                // errorText: 'Промокод не может быть применен',
                                errorBorder: InputBorder.none,
                                alignLabelWithHint: false,
                                enabled: true,
                                labelStyle: TextStyle(
                                    color: Color(0xff818C99),
                                    fontFamily: "Montserrat",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: -0.32),
                                labelText: "  Введите промокод",
                                disabledBorder: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.red,width: 1,)),
                                focusedBorder: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.red,width: 1,)),
                                focusedErrorBorder: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.red,width: 1,)),
                                enabledBorder: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Color(0xFFF2F3F5),width: 1,)),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Промокод не может быть применен";
                                } else {
                                  setState(() {
                                    promocode = value;
                                  });
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 18, 13, 30),
                        child: SizedBox(
                          // width: 131,
                          height: 44,
                          child: new RaisedButton(
                            elevation: 0,
                            color: Color(0xFFE3FCE9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: new Text(
                              'Применить',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            onPressed: () async {
                              // if (_formKey.currentState.validate()){
                              //   List<PromoPriceElement> prices = await API.promocode(baskettt, promocode);
                              //   Set promoPricesIds = new Set();
                              //   prices.forEach((element) => promoPricesIds.add(element.courseId));
                              //   setState(() {
                              //     promoPrices = prices;
                              //     isPromocodeUsed = true;
                              //     baskettt.forEach((e) {
                              //       if (promoPricesIds.contains(e.id)) {
                              //        e.newPrice =  promoPrices.where((price) => price.courseId == e.id).first.newPrice;
                              //        e.promocode = promocode;
                              //       }
                              //     });
                              //   });
                              // }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  warning == true ? Text('У вас есть несовместимые компоненты',style: TextStyle(color: Colors.black),) : Container(),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 7, 27),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              checkValue = !checkValue;
                            });
                          },
                          child: checkValue
                              ? Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey,
                                      )),
                                ),
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 7),
                                child: Text('Я ознакомлен с условиями ',style: Theme.of(context).textTheme.subtitle1,)),
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/contractOfferPage');
                                },
                                child: Text(
                                  'договора-оферты',
                                  style: TextStyle(color: Colors.blue, fontSize: 12,fontStyle: FontStyle.normal,fontWeight: FontWeight.w400,letterSpacing: -0.24),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                            child: Row(
                              children: [
                                Text(
                                  'Итого: ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: "Montserrat"),
                                ),
                                Text(
                                  "1500",
                                      // .map<int>((e) => e.newPrice != null ? e.newPrice : e.price)
                                      // .reduce((a, b) => a + b)
                                      // .toString(),
                                  style: TextStyle(
                                    color: Color(0xFF00A0D8),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: "Montserrat"),
                                )
                              ],
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(7, 0, 13, 0),
                        child: SizedBox(
                          // width: 131,
                          height: 44,
                          child: new RaisedButton(
                            elevation: 0,
                            color: Color(0xFF478414),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: new Text('Оформить',style: Theme.of(context).textTheme.headline5),
                            onPressed: () {
                              showDialog(context: context, builder: (BuildContext context) => _show1BAsket(context));
                            },
                          ),
                        ),
                      )

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _show1BAsket(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context,StateSetter setState) => Dialog(
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
                Text('У вас есть продукты которые нельзя применять совместно', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: Colors.black)),
                Text(
                    'Для вашей безопасности укажите причину их совместной покупки',
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
                listTileForDialogBasket(context,'Для отдельгного приема'),
                listTileForDialogBasket(context, 'Для другого члена семьи'),
                listTileForDialogBasket(context, 'Для другого человека'),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      showDialog(context: context, builder: (BuildContext context) => show2BAsket(context));
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
      ),) );
  }

  Widget show2BAsket(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.only(top: MediaQuery
          .of(context)
          .size
          .height * 0.35),
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
                      showDialog(context: context, builder: (BuildContext context) => CatalogScreen());
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

  Widget listTileForDialogBasket(BuildContext context,String text) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFF5FAFD), width: 1))),
      child:
      Container(
        margin: EdgeInsets.only(left: 24,right: 24),
        child: InkWell(
          onTap: (){
            setState(() {
              ischeck = !ischeck;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(text, style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontFamily: 'Roboto',
                fontSize: 16,
                color: Colors.black)),
           ischeck ? Neumorphic(
              child: Container(height: 20, width: 20, decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white
              ),
                child: Center(
                  child: Container(height: 15, width: 15, decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFF478414)
                  ),
                  ),
                ),
              ),
            ) : Neumorphic(
             child: Container(height: 20, width: 20, decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(100),
                 color: Colors.white
             ),
             ),
           )

            ],),
        ),
      ),
    );
  }

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

}

