import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/pickers/scroll_picker.dart';


class OrderingSheet extends StatefulWidget {
  @override
  _OrderingSheetState createState() => _OrderingSheetState();
}

class _OrderingSheetState extends State<OrderingSheet> {

  List<String> orderData = <String>[
    'الترتيب الافتراضي',
    'السعر : من الاعلى الى الأقل',
    'السعر : من الأقل الى الأعلى',
    'أبجدي : من الألف الى الياء',
    'أبجدي : من الياء الى الألف' ,
    'التاريخ : من الأحدث الى الأقدم',
    'التاريخ : من الأقدم الى الأحدث',
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 270,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 50,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                  color: Colors.yellow[600],
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0),
                  )),
              child: Text('الترتيب',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0
              ),),
            ),
            Container(
              height: 200,
              child: ScrollPicker(
                initialValue: orderData[0],
                items: orderData,

              )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: FlatButton(
                  color: Colors.yellow[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text('حسناً',style: TextStyle(fontSize: 20.0),),
                  onPressed: (){},
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
