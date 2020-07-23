import 'package:flutter/material.dart';
import 'package:pazar_app/UI/main_screen/shopping_pageUI/shopping_item.dart';
import 'package:pazar_app/appDesign/shopping_page_design.dart';
import 'package:pazar_app/model/add_to_shopping_bag_model.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  ShoppingPageDesign _design = new ShoppingPageDesign();
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                child: ListView.builder(
                    itemCount: myShoppingBag.length,
                    itemBuilder: (BuildContext context, int index) {
                      totalPrice += double.parse(myShoppingBag[index].price) *
                          myShoppingBag[index].amount;
                      return ShoppingItem(myShoppingBag[index]);
                    }),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: TextDirection.rtl,
                          children: <Widget>[
                            Material(
                              child: Text(
                                _design.total,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Material(
                                    child: Text(
                                  totalPrice.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                )),
                                Material(
                                    child: Text(_design.lira,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                        )))
                              ],
                            )
                          ],
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Material(
                              child: Text(_design.discount,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Material(
                              child: FlatButton(
                                onPressed: () {},
                                color: Colors.transparent,
                                child: Text(
                                  _design.addCoupon,
                                  style: TextStyle(
                                      color: Colors.yellow[600],
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Row(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Material(
                                    child: Text(
                                  totalPrice.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                )),
                                Material(
                                    child: Text(_design.lira,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                        )))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                              child: Text(
                                _design.buyNow,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15.0),
                              ),
                              color: Colors.yellow[600],
                              onPressed: () {},
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Material(child: Text(_design.total)),
                              Expanded(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: <Widget>[
                                    Material(
                                        child: Text(
                                      '0.00',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                    )),
                                    Material(
                                        child: Text(_design.lira,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                            )))
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
