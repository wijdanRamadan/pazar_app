import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pazar_app/appDesign/for_sale_item_card_design.dart';
import 'package:pazar_app/model/card.dart';

class ForSaleItemCard extends StatefulWidget {
  List<NormalCardModel> cardInfo;

  int index;

  ForSaleItemCard(this.cardInfo, this.index);

  @override
  _ForSaleItemCardState createState() => _ForSaleItemCardState();
}

class _ForSaleItemCardState extends State<ForSaleItemCard> {
  ForSaleItemCardDesign _cardDesign = ForSaleItemCardDesign();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 400,
      child: Card(
        shadowColor: Colors.grey,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                child: Container(
                    child: Image(
                  image: AssetImage(widget.cardInfo[widget.index].image),
                )),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topRight,
                child: Text(
                  widget.cardInfo[widget.index].productName,
                  style: TextStyle(
                      color: _cardDesign.productTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                child: Text(
                  widget.cardInfo[widget.index].price,
                  style: TextStyle(
                    color: _cardDesign.productPriceTextColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topRight,
                child: Text(
                  widget.cardInfo[widget.index].amount,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  color: _cardDesign.addToCardButtonBackgroundColor,
                  child: ButtonTheme(
                    minWidth: double.infinity,
                    child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(_cardDesign.addToCardIconColorText),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                              child: Icon(Icons.shopping_cart),
                            )
                          ],
                        )),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
