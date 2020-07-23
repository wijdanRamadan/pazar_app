import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pazar_app/UI/introductoryUI.dart';
import 'package:pazar_app/appDesign/loading_ui_design.dart';

class LoadingUI extends StatefulWidget {
  @override
  _LoadingUIState createState() => _LoadingUIState();
}

class _LoadingUIState extends State<LoadingUI> {
  LoadingUIDesign _uiDesign = LoadingUIDesign();

  @override
  void initState() {
    Timer timer = new Timer(const Duration(seconds: 1), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => IntroductoryUI()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _uiDesign.backgroundColor,
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                _uiDesign.website, //Loading page Text
                style: TextStyle(
                    color: _uiDesign.websiteFontColor,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Icon(
              _uiDesign.icon.icon, //Loading page icon
              color: _uiDesign.iconColor,
              size: 100.0,
            ),
          ],
        ),
      )),
    );
  }
}
