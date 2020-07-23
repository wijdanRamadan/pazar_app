import 'package:flutter/material.dart';
import 'package:pazar_app/appDesign/for_sale_item_ui_design.dart';
import 'package:pazar_app/model/add_to_shopping_bag_model.dart';
import 'package:pazar_app/model/card.dart';
import 'package:pazar_app/model/home_page_content.dart';

import 'for_sale_item_card.dart';

class ForSaleItemUI extends StatefulWidget {
  ShoppingBagModel _shoppingBagModel;

  ForSaleItemUI(this._shoppingBagModel);

  @override
  _ForSaleItemUIState createState() => _ForSaleItemUIState();
}

class _ForSaleItemUIState extends State<ForSaleItemUI> {
  ForSaleItemDesign _design = ForSaleItemDesign();

  List<NormalCardModel> cards = [
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FittedBox(
                    child: Image.asset(widget._shoppingBagModel.image),
                    fit: BoxFit.fitWidth,
                  ),
                  IconButton(
                    icon: Image.asset('assets/back.png'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    widget._shoppingBagModel.productName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Image(
                    image: AssetImage('assets/down_arrow.png'),
                  ),
                ],
              )),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    widget._shoppingBagModel.price,
                    style: TextStyle(
                        color: Colors.yellow[500],
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(widget._shoppingBagModel.description),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  _design.relatedProducts,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 20.0),
              child: Container(
                child: ListView.builder(
                    itemCount: cards.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                          child: ForSaleItemCard(cards, index), onTap: () {});
                    }),
              ),
            ),
          ),
          Divider(
            height: 0.0,
            color: Colors.grey[800],
          ),
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: FlatButton(
                          child: Text(
                            _design.addToCard,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: Colors.yellow[500],
                          onPressed: () {
                            myShoppingBag.add(widget._shoppingBagModel);
                            _showAddedMessage(context);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Wrap(children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Row(
                            children: <Widget>[
                              ButtonTheme(
                                  minWidth: 20.0,
                                  height: 30.0,
                                  child: FlatButton(
                                    color: Colors.grey[300],
                                    onPressed: () {
                                      setState(() {
                                        widget._shoppingBagModel.amount++;
                                      });
                                    },
                                    child: Text('+'),
                                  )),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Text(
                                    widget._shoppingBagModel.amount.toString()),
                              ),
                              ButtonTheme(
                                  minWidth: 20.0,
                                  height: 30.0,
                                  child: FlatButton(
                                    color: Colors.grey[300],
                                    onPressed: () {
                                      setState(() {
                                        if (widget._shoppingBagModel.amount > 0)
                                          widget._shoppingBagModel.amount--;
                                      });
                                    },
                                    child: Text('-'),
                                  )),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              )),
        ]),
      ),
    );
  }

  void _showAddedMessage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 50,
            child: Text(
              'تمت الاضافة الى السلة',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.yellow[600],
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        });
  }
}

List<Widget> _getRelatedProducts(PageController _pageController,
    PageController _pageController1, Function _onPageChanged) {
  List<Widget> widgets = new List<Widget>();

  for (int i = 0; i < contentList.length; i++) {
    widgets.add(Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(8.0),
          child: new Text(
            contentList[i].title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
        new Container(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          height: 200,
          width: 100,
          child: ListView.builder(
              itemCount: contentList[i].cards.length,
              scrollDirection: Axis.horizontal,
              controller: _pageController1,
              itemBuilder: (context, index) {
                return InkWell(
                    child: ForSaleItemCard(contentList[i].cards, index),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForSaleItemUI(
                                  new ShoppingBagModel(
                                      contentList[i].cards[index].image,
                                      contentList[i].cards[index].productName,
                                      contentList[i].cards[index].price,
                                      contentList[i].cards[index].amount,
                                      1))));
                    });
                //ForSaleItemCard(contentList[index].cards, index);
              }),
        ),
      ],
    ));
  }
  return widgets;
}
