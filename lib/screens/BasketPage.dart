
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iherb_helper/widgets/app_scaffold.dart';

class BasketPage extends StatefulWidget {
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
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

  Widget basket(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Container(
                // margin: EdgeInsets.fromLTRB(0, 0, 0, 11),
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 1,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, item) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          // baskettt[item].checked = !baskettt[item].checked;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(13, 0, 13, 14),
                        padding: EdgeInsets.fromLTRB(13, 0, 13, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //верхняя ровка в карточке с крестиком
                            Row(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 8),
                                    height: 12,
                                    width: 12,
                                    child: IconButton(
                                      icon: Icon(
                                        CupertinoIcons.clear_thick,
                                        size: 13,
                                      ),
                                      onPressed: () {},
                                    ))
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(margin: EdgeInsets.only(bottom: 10),
                                  child: Icon(
                                    Icons.add_link,
                                    color: Colors.blue,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 15,
                                    bottom: 10
                                  ),
                                  child: Text(
                                    "v",
                                    // baskettt[item].type,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    ' ',
                                    // baskettt[item].name,
                                    maxLines: 2,
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ),
                                  // baskettt[item].checked
                                  //   ? Container(
                                  //       // margin: EdgeInsets.only(left: 40),
                                  //       height: 20,
                                  //       width: 20,
                                  //       decoration: BoxDecoration(
                                  //           color: Color(0xFF00A0D8),
                                  //           shape: BoxShape.circle,),
                                  //       child: Center(
                                  //         child: Icon(
                                  //           Icons.check,
                                  //           size: 12,
                                  //           color: Colors.white,
                                  //         ),
                                  //       ),
                                  //     )
                                  //   :
                                          Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.grey,
                                            )),
                                      ),
                              ],
                            ),
                            // isPromocodeUsed &&
                            //     promoPrices.where((element) =>
                            //       element.courseId == baskettt[item].id)
                            //         .first
                            //         .newPrice < baskettt[item].price
                            //   ?
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 14, 0, 20),
                                  child: Text(
                                    // baskettt[item].price.toString() +
                                        " руб.",
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 14, 0, 20),
                                  child: Text(
                                    // "     " + baskettt[item].newPrice.toString() +
                                        " руб.",
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    )
                                  ),
                                ),
                              ],
                            )
                            //     :
                            // Container(
                            //   margin: EdgeInsets.fromLTRB(0, 14, 0, 20),
                            //   child: Text(
                            //     // baskettt[item].price.toString() +
                            //         " руб.",
                            //     style: Theme.of(context).textTheme.headline6,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
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
                              color: Colors.grey,
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
                                    "baskettt",
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
                        checkValue
                            ? Container(
                                margin: EdgeInsets.fromLTRB(7, 0, 13, 0),
                                child: SizedBox(
                                  // width: 131,
                                  height: 44,
                                  child: new RaisedButton(
                                    elevation: 0,
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: new Text('Оформить',style: Theme.of(context).textTheme.headline5),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/basket2Page');
                                    },
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.fromLTRB(7, 0, 13, 0),
                                child: SizedBox(
                                  // width: 131,
                                  height: 44,
                                  child: new RaisedButton(
                                    elevation: 0,
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: new Text(
                                      'Оформить',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                    onPressed: () {

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
      ),
    );
  }
}

// // TODO лист для покупок
// List<BasketItem> baskettt = [
//   /*BasketItem(
//       "6594359926736250979",
//       "Электронный курс",
//       "Разработка инновационного продукта",
//       1500,
//       true), */
//   BasketItem(
//       "6875311867164835485",
//       "Электронный курс",
//       "Подтверждение квалификации и продление сертификата С31000 СERTIFIED ISO 31000 RISK MANAGEMENT PROFESSIONAL",
//       14000,
//       true)
// ];
