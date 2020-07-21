


import 'package:flutter/foundation.dart';
import 'package:pazar_app/model/card.dart';

class HomePageContentModel
{
    String title;
    List<NormalCardModel> cards;

    HomePageContentModel(this.title,this.cards);

}

final List<Category> contentList1 = new List();
final List<HomePageContentModel> contentList = [
  HomePageContentModel('خضروات', [
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('خيار', 'assets/pepino.jpg', '2.00', 'كيلو غرام'),
    NormalCardModel('فليفلة', 'assets/pepar.jpg', '2.00', 'كيلو غرام'),
    NormalCardModel('خيار', 'assets/pepino.jpg', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('فليفلة', 'assets/pepar.jpg', '2.00', 'كيلو غرام'),
  ]),
  HomePageContentModel('خيار', [
    NormalCardModel('خيار', 'assets/pepino.jpg', '2.00', 'كيلو غرام'),
    NormalCardModel('خيار', 'assets/pepino.jpg', '2.00', 'كيلو غرام'),
    NormalCardModel('خيار', 'assets/pepino.jpg', '2.00', 'كيلو غرام'),
    NormalCardModel('خيار', 'assets/pepino.jpg', '2.00', 'كيلو غرام'),
  ]),
  HomePageContentModel('خضروات', [
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام')
  ]),
  HomePageContentModel('خضروات', [
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام')
  ]),
  HomePageContentModel('خضروات', [
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام')
  ]),
  HomePageContentModel('خضروات', [
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام'),
    NormalCardModel('بندورة ', 'assets/test.png', '2.00', 'كيلو غرام')
  ]),
];
