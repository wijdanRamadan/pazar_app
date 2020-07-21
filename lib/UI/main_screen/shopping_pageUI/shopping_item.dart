import 'package:flutter/material.dart';
import 'package:pazar_app/model/add_to_shopping_bag_model.dart';

class ShoppingItem extends StatefulWidget {
  ShoppingBagModel _shoppingBagModel;

  ShoppingItem(this._shoppingBagModel);

  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
            child: Image(
              image: AssetImage(
                widget._shoppingBagModel.image,
              ),
              width: 128,
              height: 128,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Material(child: Text(widget._shoppingBagModel.description)),
              Material(child: Text(widget._shoppingBagModel.productName)),
              Material(child: Text(widget._shoppingBagModel.price)),
            ],
          ),
          SizedBox(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Material(
                      child: Text(widget._shoppingBagModel.amount.toString())),
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
        ],
      ),
    );
  }
}
