import 'package:flutter/material.dart';
import 'package:pazar_app/UI/main_screen/my_account_pageUI/my_account_configurations/account_configurations.dart';
import 'package:pazar_app/UI/main_screen/my_account_pageUI/my_addresses/my_addresses.dart';
import 'package:pazar_app/appDesign/my_account_with_login_design.dart';
import 'package:pazar_app/networking/model/Profile.dart';

class MyAccountWithLogIn extends StatefulWidget {
  @override
  _MyAccountWithLogInState createState() => _MyAccountWithLogInState();
}

class _MyAccountWithLogInState extends State<MyAccountWithLogIn> {
  MyAccountWithLoginDesign _design = new MyAccountWithLoginDesign();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.amber,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                child: profile.name != null
                                    ? Text(
                                        profile.name,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.yellow[600],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Text('unknown'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                  child: profile.email != null
                                      ? Text(
                                          profile.email,
                                          style: TextStyle(),
                                          textDirection: TextDirection.rtl,
                                        )
                                      : Text('000000')),
                            ),
                            FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AccountConfigurations()));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.settings),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15.0, 8.0, 15.0, 8.0),
                                      child: Text(
                                        _design.accountConfig,
                                        style: TextStyle(
                                            color: _design.fontColor,
                                            fontSize: _design.fontSize,
                                            fontWeight: FontWeight.bold),
                                        textDirection: TextDirection.rtl,
                                      ),
                                    )
                                  ],
                                  textDirection: TextDirection.rtl,
                                )),
                            FlatButton(
                                onPressed: () {},
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Icon(Icons.shopping_basket),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15.0, 8.0, 15.0, 8.0),
                                      child: Text(
                                        _design.purchases,
                                        style: TextStyle(
                                            color: _design.fontColor,
                                            fontSize: _design.fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                )),
                            FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyAddresses()));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.location_on),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15.0, 8.0, 15.0, 8.0),
                                      child: Text(
                                        _design.addresses,
                                        style: TextStyle(
                                            color: _design.fontColor,
                                            fontSize: _design.fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                  textDirection: TextDirection.rtl,
                                )),
                            FlatButton(
                              onPressed: () {},
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.favorite_border),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15.0, 8.0, 15.0, 8.0),
                                    child: Text(
                                      _design.favorite,
                                      style: TextStyle(
                                          color: _design.fontColor,
                                          fontSize: _design.fontSize,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ]))),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              child: ExpansionTile(
                                leading: Icon(Icons.keyboard_arrow_down),
                                title: Text(
                                  _design.appLang,
                                  textDirection: TextDirection.rtl,
                                ),
                                trailing: Icon(Icons.language),
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      FlatButton(
                                        child: Text(_design.turkish),
                                        onPressed: () {},
                                      ),
                                      FlatButton(
                                        child: Text(_design.arabic),
                                        onPressed: () {},
                                      )
                                    ],
                                    textDirection: TextDirection.rtl,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side:
                                          BorderSide(color: Colors.grey[200])),
                                  onPressed: () {},
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15.0, 8.0, 15.0, 8.0),
                                        child: Icon(Icons.input),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15.0, 8.0, 15.0, 8.0),
                                        child: Text(
                                          _design.logOut,
                                          style: TextStyle(
                                              color: _design.fontColor,
                                              fontSize: _design.fontSize,
                                              fontWeight: FontWeight.bold),
                                          textDirection: TextDirection.rtl,
                                        ),
                                      )
                                    ],
                                    textDirection: TextDirection.rtl,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                                child: Text(
                              _design.contactUs,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20.0),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Material(
                                    child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset('assets/facebook.png',
                                          width: 32.0, height: 32.0),
                                    ),
                                  ),
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                      child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                            'assets/instagram.png',
                                            width: 32.0,
                                            height: 32.0),
                                      ),
                                    ),
                                  )),
                                ),
                                Material(
                                    child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        'assets/whatsapp.png',
                                      ),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                                child: Text(
                              _design.appVersion,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15.0),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                                child: Text(
                              '3.1.9',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 10.0),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
//             ]),
        ),
      ),
    );
  }
}
