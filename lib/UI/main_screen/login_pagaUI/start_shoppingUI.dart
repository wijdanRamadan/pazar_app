import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:pazar_app/UI/main_screen/main_screenUI.dart';
import 'package:pazar_app/appDesign/start_shopping_design.dart';
import 'package:pazar_app/networking/api_services.dart';
import 'package:pazar_app/networking/model/FacebookAuthRequest.dart';
import 'package:pazar_app/networking/model/Profile.dart';
import 'package:pazar_app/networking/model/RequestVerificationBody.dart';

class StartShopping extends StatefulWidget {
  @override
  _StartShoppingState createState() => _StartShoppingState();
}

class _StartShoppingState extends State<StartShopping> {
  FacebookLogin facebookSignIn = new FacebookLogin();
  final myController = TextEditingController();

  StartShoppingDesign _design = StartShoppingDesign();
  FacebookAuthRequest authRequest = new FacebookAuthRequest();

  Future<Null> _login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
    final FirebaseAuth _auth = FirebaseAuth.instance;

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        AuthCredential credential =
            FacebookAuthProvider.getCredential(accessToken: accessToken.token);
        AuthResult authResult =
            // ignore: missing_return
            await _auth.signInWithCredential(credential).then((value) {
          profile.facebookToken = accessToken.token;
          profile.facebookAccountId = accessToken.userId;
          profile.phone = value.user.phoneNumber;
          profile.email = value.user.email;
          profile.name = value.user.displayName;

          authRequest.email = profile.email;
          authRequest.name = profile.name;
          authRequest.facebook_account_id = profile.facebookAccountId;
          authRequest.facebook_token = profile.facebookToken;
          authRequest.device = "ANDROID";
          authRequest.firebase_token = value.user.uid;
          if (value.user.phoneNumber != null)
            authRequest.phone = value.user.phoneNumber;
          else
            authRequest.phone = "01000000000";
          authRequest.COMMENT = "sss";
          authRequest.region_id = 1;
          authRequest.default_address = "xxxxxx";

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainScreen()));
        });

        await http
            .post(
          "http://dolato.boraq-group.net/api/auth-facebook",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(authRequest),
        )
            .then((value) {
          print(value.body);
        });
    }
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        _design.appIcon.icon,
                        size: 50.0,
                        color: _design.iconColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          _design.appName,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  _design.labelText,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: _design.labelTextColor),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: myController,
                    decoration: InputDecoration(
                      hintText: '555 555 5555',
                      contentPadding: EdgeInsets.fromLTRB(8.0, 15.0, 0.0, 0.0),
                      prefixIcon: SizedBox(
                        child: Center(
                            widthFactor: 0.0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '+90',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                            )),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    color: _design.nextButtonBackgroundColor,
                    onPressed: () {
                      final dio = Dio(); // Provide a dio instance
                      final client = ApiClient(dio);
                      RequestVerificationBody r = new RequestVerificationBody();
                      r.phone = myController.text;
                      client.getVerificationCode(r).then((value) =>
                          Navigator.pushReplacementNamed(
                              context, '/phoneAuthentication',
                              arguments: {'verification_response': value}));
                    },
                    child: Text(
                      _design.nextButtonText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _design.nextButtonTextColor),
                    ),
                  ),
                ),
              ),
              FlatButton(
                  color: Colors.black,
                  child: Text(
                    'login with facebook',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _login),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                child: Text(
                  _design.skipButtonText,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: _design.skipButtonTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
