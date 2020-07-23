import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pazar_app/UI/for_sale_item_card.dart';
import 'package:pazar_app/UI/main_screen/classification_pageUI/all_classificationPageUI/all_classificationUI.dart';
import 'package:pazar_app/UI/main_screen/classification_pageUI/classificationsUI.dart';
import 'package:pazar_app/UI/main_screen/home_pageUI/home_pageUI.dart';
import 'package:pazar_app/UI/main_screen/my_account_pageUI/my_accout_with_login.dart';
import 'package:pazar_app/UI/main_screen/notification_pageUI/notificationsUI.dart';
import 'package:pazar_app/appDesign/main_screen_bottom_menu_design.dart';
import 'package:pazar_app/model/home_page_content.dart';
import 'package:pazar_app/model/home_page_slide.dart';
import 'package:pazar_app/widgets/home_slide_item.dart';

import 'shopping_pageUI/shopping_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentBottomNavIndex = 0;
  int _currentSliderPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final PageController _pageController1 = PageController(initialPage: 0);
  BottomMenuDesign _design = new BottomMenuDesign();

  int _innerTabsIndex = -1;
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 50.0);

  int get innerTabsIndex => _innerTabsIndex;

  set innerTabsIndex(int value) {
    _innerTabsIndex = value;
  }

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

  final Hometabs = [
    HomePage(),
    ClassificationUI(),
    ShoppingPage(),
    NotificationsUI(),
    MyAccountWithLogIn()
  ];

  final innerTabs = [AllClassifications()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _innerTabsIndex < 0
          ? Hometabs[_currentBottomNavIndex]
          : innerTabs[_innerTabsIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber[800],
        currentIndex: _currentBottomNavIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _design.home.icon,
              color: Colors.grey,
            ),
            title: Text(_design.homeIconText,
                style: TextStyle(color: Colors.grey)),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                _design.classifications.icon,
                color: Colors.grey,
              ),
              title: Text(_design.classificationsIconText,
                  style: TextStyle(color: Colors.grey))),
          BottomNavigationBarItem(
              icon: Icon(
                _design.cart.icon,
                color: Colors.grey,
              ),
              title: Text(_design.cartIconText,
                  style: TextStyle(color: Colors.grey))),
          BottomNavigationBarItem(
              icon: Icon(
                _design.notifications.icon,
                color: Colors.grey,
              ),
              title: Text(_design.notificationsIconText,
                  style: TextStyle(color: Colors.grey))),
          BottomNavigationBarItem(
              icon: Icon(
                _design.myAccount.icon,
                color: Colors.grey,
              ),
              title: Text(
                _design.myAccountIconText,
                style: TextStyle(color: Colors.grey),
              ))
        ],
        onTap: (index) {
          setState(() {
            _currentBottomNavIndex = index;
          });
        },
      ),
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
              itemCount: contentList.length,
              scrollDirection: Axis.horizontal,
              controller: _pageController1,
              itemBuilder: (context, index) {
                return ForSaleItemCard(contentList[index].cards, index);
              }),
        ),
      ],
    ));
  }
  return widgets;
}

AppBar _appBar(index) {
  List<AppBar> appBars = new List<AppBar>();

  appBars.add(new AppBar(
    backgroundColor: Colors.amber,
    title: Padding(
      padding: const EdgeInsets.fromLTRB(90.0, 0.0, 90.0, 0.0),
      child: Row(
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
    ),
    centerTitle: true,
    actions: <Widget>[
      Icon(
        Icons.search,
        color: Colors.black,
      ),
    ],
  ));
  appBars.add(new AppBar(
    backgroundColor: Colors.amber,
    title: Padding(
      padding: const EdgeInsets.fromLTRB(90.0, 0.0, 90.0, 0.0),
      child: Row(
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
    ),
    centerTitle: true,
    actions: <Widget>[
      Icon(
        Icons.search,
        color: Colors.black,
      ),
    ],
  ));
  appBars.add(new AppBar(
    backgroundColor: Colors.amber,
    title: Padding(
      padding: const EdgeInsets.fromLTRB(90.0, 0.0, 90.0, 0.0),
      child: Row(
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
    ),
    centerTitle: true,
  ));
  appBars.add(new AppBar(
    backgroundColor: Colors.amber,
    title: Padding(
      padding: const EdgeInsets.fromLTRB(90.0, 0.0, 90.0, 0.0),
      child: Row(
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
    ),
    centerTitle: true,
  ));
  appBars.add(new AppBar(
    backgroundColor: Colors.amber,
    title: Padding(
      padding: const EdgeInsets.fromLTRB(90.0, 0.0, 90.0, 0.0),
      child: Row(
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
    ),
    centerTitle: true,
  ));

  return appBars[index];
}
