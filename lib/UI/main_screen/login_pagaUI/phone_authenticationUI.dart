import 'package:flutter/material.dart';
import 'package:pazar_app/UI/main_screen/main_screenUI.dart';
import 'package:pazar_app/appDesign/phone_auth_design.dart';
import 'package:pazar_app/appDesign/start_shopping_design.dart';
import 'package:pazar_app/networking/model/RequestVerificationResponse.dart';

class PhoneAuthenticationPage extends StatefulWidget {
  @override
  _PhoneAuthenticationPageState createState() =>
      _PhoneAuthenticationPageState();
}

class _PhoneAuthenticationPageState extends State<PhoneAuthenticationPage> {
  final myController = TextEditingController();

  StartShoppingDesign _design = StartShoppingDesign();
  PhoneAuthDesign _phoneAuthDesign = PhoneAuthDesign();

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    RequestVerificationResponse verificationResponse =
        data['verification_response'];
    String verificationCode = verificationResponse.verification_code.toString();
    print(verificationResponse.verification_code);

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(_design.backgroundImage),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "التحقق من رقم الموبايل"
                    "your verification code is :$verificationCode ",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: myController,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    child: Text(
                      _phoneAuthDesign.buttonText,
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                    onPressed: () {
                      if (myController.text ==
                          verificationResponse.verification_code.toString()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      } else {}
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
