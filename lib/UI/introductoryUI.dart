import 'package:flutter/material.dart';
import 'package:pazar_app/UI/main_screen/login_pagaUI/start_shoppingUI.dart';
import 'package:pazar_app/appDesign/introductory_ui_design.dart';
import 'package:pazar_app/model/introductory_slide.dart';
import 'package:pazar_app/widgets/introductory_slide_item.dart';
import 'package:pazar_app/widgets/slide_dots.dart';

class IntroductoryUI extends StatefulWidget {
  @override
  _IntroductoryUIState createState() => _IntroductoryUIState();
}

class _IntroductoryUIState extends State<IntroductoryUI> {
  IntroductoryDesign _design = IntroductoryDesign();

  int _currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(_design.backgroundImage),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
                textDirection: TextDirection.rtl,
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  PageView.builder(
                    reverse: true,
                    onPageChanged: _onPageChanged,
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    itemCount: slideList.length,
                    itemBuilder: (context, i) => IntroductorySlideItem(i),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 250.0, 150.0, 0.0),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < slideList.length; i++)
                          if (i == _currentPage)
                            SlideDots(true, false)
                          else
                            SlideDots(false, false)
                      ],
                    ),
                  ),
                  if (_currentPage == 2)
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StartShopping()));
                            },
                            child: Text(
                              _design.buttonText,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: _design.buttonTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: Colors.black,
                            splashColor: Colors.black,
                            textColor: Colors.white,
                          )),
                    )
                ]),
          ),
        ),
      ),
    );
  }
}
