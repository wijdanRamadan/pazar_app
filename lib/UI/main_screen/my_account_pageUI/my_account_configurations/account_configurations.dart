import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountConfigurations extends StatefulWidget {
  @override
  _AccountConfigurationsState createState() => _AccountConfigurationsState();
}

class _AccountConfigurationsState extends State<AccountConfigurations> {
  bool isSwitched = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'إعدادات حسابي',
            textDirection: TextDirection.rtl,
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: <Widget>[
                        Expanded(
                          child: Text('تنبيه تغيير حالة الطلب بواسطة اشعارات التطبيق', textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20.0
                          ),),
                        ),
                        Switch(
                          activeColor: Colors.yellow[600],
                          value: isSwitched1,
                          onChanged: (value) {
                            isSwitched1 = value;
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: <Widget>[
                        Text('الرسائل الاعلانية بواسطة التطبيق' , textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 20.0
                    )),
                        Switch(
                          activeColor: Colors.yellow[600],
                          value: isSwitched2,
                          onChanged: (value) {
                            isSwitched2 = value;
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: <Widget>[
                        Text('رسائل تغيير حالة الطلب بواسطة ',textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 20.0
                    )),
                        Switch(
                          activeColor: Colors.yellow[600],
                          value: isSwitched3,
                          onChanged: (value) {
                            isSwitched3 = value;
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: <Widget>[
                        Text('رسائل الاعلانات بواسطة ', textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 20.0
                    )),
                        Switch(
                          activeColor: Colors.yellow[600],
                          value: isSwitched4,
                          onChanged: (value) {
                            isSwitched4 = value;
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
