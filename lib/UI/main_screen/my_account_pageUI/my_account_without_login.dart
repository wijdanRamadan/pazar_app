import 'package:flutter/material.dart';
import 'package:pazar_app/appDesign/my_account_without_login.dart';

class MyAccountWithoutLogIn extends StatefulWidget {
  @override
  _MyAccountWithoutLogInState createState() => _MyAccountWithoutLogInState();
}

class _MyAccountWithoutLogInState extends State<MyAccountWithoutLogIn> {
  MyAccountWithoutLoginDesign _design = new MyAccountWithoutLoginDesign();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.person),
                      label: Text(
                        _design.signIn,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    child: ExpansionTile(
                      leading: Icon(Icons.keyboard_arrow_down),
                      title: Text(
                        _design.appLang,
                        textDirection: TextDirection.rtl,
                      ),
                      backgroundColor: Colors.white,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                      child: Text(
                    'تواصل معنا ',
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
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('assets/instagram.png',
                                  width: 32.0, height: 32.0),
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
      ),
    );
  }
}
