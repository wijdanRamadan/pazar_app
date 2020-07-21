import 'package:flutter/material.dart';

class SaleCardModel {
  String image;
  String saleImage;
  String productName;
  String oldPrice;
  String newPrice;
  String amount;

  //for coloring the button
  bool isAvailable;

  SaleCardModel(
      {@required this.image,
      @required this.saleImage,
      @required this.oldPrice,
      @required this.newPrice,
      @required this.amount});
}
