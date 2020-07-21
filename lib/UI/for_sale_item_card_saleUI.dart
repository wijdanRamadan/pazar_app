

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pazar_app/appDesign/for_sale_with_sale_card_design.dart';

class ForSaleCardWithSale extends StatefulWidget {
  @override
  _ForSaleCardWithSaleState createState() => _ForSaleCardWithSaleState();
}

class _ForSaleCardWithSaleState extends State<ForSaleCardWithSale> {

  ForSaleItemCardWithSaleDesign _design =ForSaleItemCardWithSaleDesign();

  @override
  Widget build(BuildContext context) {
    return

        Container(
          padding: EdgeInsets.fromLTRB(100,10.0,100,10.0),
          width: double.maxFinite,
          height: 250,
          child: Card(
            shadowColor: Colors.grey,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0,8.0,15.0,8.0),
                    child: Container(
                      decoration: BoxDecoration(

                        image: DecorationImage(
                          image:AssetImage('assets/test.png'),)

                      ),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child:Image(image: AssetImage(_design.forSaleImage,
                      )
                      ),
                    )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Text('بندورة',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                      color: _design.productTextColor),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('2323' ,
                        style: TextStyle(
                          color: _design.productOldPriceTextColor,
                          decoration: TextDecoration.lineThrough,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        ),),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,0.0,0.0,0.0),
                          child: Text('0.00ليرة ',
                            style: TextStyle(
                              color: _design.productNewPriceTextColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,),
                          ),
                        )
                      ],

                    ),
                  ),
                ),
                Expanded(flex: 1,
                  child: Container(
                    alignment: Alignment.topRight,

                    child: Text(' كيلو غرام ' ,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: _design.productAMountTextColor
                      ),
                    ),
                  ),),
                Expanded(flex: 1,
                  child: Container(color: Colors.yellow[500],
                      child:
                      ButtonTheme(

                        minWidth: double.infinity,
                        child:FlatButton(
                           color:_design.addToCardButtonBackgroundColor ,
                            onPressed: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('إضافة الى السلة',
                                style: TextStyle(
                                  color: _design.addToCardButtonTextColor
                                ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,0.0),
                                  child: Icon(Icons.shopping_cart),
                                )
                              ],
                            )



                        ),))
                  ,
                ),
              ],
            ),

          ),

        );
  }
}
