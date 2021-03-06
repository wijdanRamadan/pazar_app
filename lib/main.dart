import 'package:flutter/material.dart';
import 'package:pazar_app/UI/main_screen/classification_pageUI/all_classificationPageUI/all_classificationUI.dart';
import 'package:pazar_app/UI/main_screen/login_pagaUI/phone_authenticationUI.dart';

import 'UI/loadingUI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoadingUI(),
        routes: {
          '/allClassifications': (context) => AllClassifications(),
          '/phoneAuthentication': (context) => PhoneAuthenticationPage()
        });
  }
}
