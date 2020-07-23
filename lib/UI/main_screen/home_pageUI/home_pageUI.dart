import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:pazar_app/UI/for_sale_itemUI.dart';
import 'package:pazar_app/UI/for_sale_item_card.dart';
import 'package:pazar_app/model/add_to_shopping_bag_model.dart';
import 'package:pazar_app/model/home_page_content.dart';
import 'package:pazar_app/model/home_page_slide.dart';
import 'package:pazar_app/widgets/home_slide_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentSliderPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final PageController _pageController1 = PageController(initialPage: 0);

  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 50.0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _pageController1.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentSliderPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentSliderPage < homePageSlideList.length) {
        _currentSliderPage++;
      } else {
        _currentSliderPage = 0;
      }
      _pageController.animateToPage(
        _currentSliderPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Pazar App',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.black,
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverList(
                      delegate: SliverChildListDelegate(_pagecontent(
                          _pageController, _pageController1, _onPageChanged)))
                ],
              ),
            ),
          ])),
    );
  }
}

List<Widget> _pagecontent(PageController _pageController,
    PageController _pageController1, Function _onPageChanged) {
  List<Widget> widgets = new List<Widget>();

  widgets.add(new Container(
    child: PageView.builder(
      onPageChanged: _onPageChanged,
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      itemCount: homePageSlideList.length,
      itemBuilder: (context, i) => HomeSlideItem(i),
    ),
    color: Colors.red,
    height: 200,
  ));

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
