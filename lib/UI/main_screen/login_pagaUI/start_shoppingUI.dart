import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:pazar_app/UI/main_screen/main_screenUI.dart';
import 'package:pazar_app/appDesign/start_shopping_design.dart';
import 'package:pazar_app/networking/api_services.dart';
import 'package:pazar_app/networking/facebook_profile_info_service.dart';
import 'package:pazar_app/networking/model/FacebookAccessTokenModel.dart';
import 'package:pazar_app/networking/model/RequestVerificationBody.dart';

class StartShopping extends StatefulWidget {
  @override
  _StartShoppingState createState() => _StartShoppingState();
}

class _StartShoppingState extends State<StartShopping> {

  FacebookLogin facebookSignIn = new FacebookLogin();


  final myController = TextEditingController();

  StartShoppingDesign _design = StartShoppingDesign();


  String _message = 'Log in/out by pressing the buttons below.';

  Future<Null> _login() async {
    final FacebookLoginResult result =
    await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final dio = Dio(); // Provide a dio instance
        final client = FacebookClient(dio);

        final FacebookAccessToken accessToken = result.accessToken;
        FacebookAccessTokenModel accessTokenModel = new FacebookAccessTokenModel(access_token: accessToken.token);

        client.getProfile(accessTokenModel).then((value) =>
            print(value.name)
        );


        _showMessage('''
         Logged in!
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
    _showMessage('Logged out.');
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
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
                  child: Text('login with facebook'
                  ,style: TextStyle(color: Colors.white),),
                  onPressed: _login
              ),
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
