import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pazar_app/UI/main_screen/my_account_pageUI/google_maps/mapUI.dart';

class MyAddresses extends StatefulWidget {
  @override
  _MyAddressesState createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {
  GoogleMapController mapController;

  final LatLng _istanbul = const LatLng(41.0082, 28.9784);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CloseButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'إضافة عنوان',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.yellow[600],
        ),
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Container(
                child: Stack(fit: StackFit.loose, children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: _istanbul,
                              zoom: 11.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text('اسم العنوان',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      )),
                                  TextField(
                                      textDirection: TextDirection.rtl,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.location_on),
                                        hintText: 'مثلا المنزل او العمل ',
                                        border: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.teal)),
                                      )),
                                  Text('المجمع',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      )),
                                  TextField(
                                      textDirection: TextDirection.rtl,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.location_on),
                                        hintText: 'مثلا المنزل او العمل ',
                                        border: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.teal)),
                                      )),
                                  Text('تفاصيل العنوان',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      )),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: Border.all(
                                            color: Colors.grey[500])),
                                    child: Row(
                                      textDirection: TextDirection.rtl,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          textDirection: TextDirection.rtl,
                                          children: <Widget>[
                                            Text('البلوك'),
                                            Container(
                                              width: 100,
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          color: Colors.grey[500],
                                          width: 1,
                                          height: 50,
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          textDirection: TextDirection.rtl,
                                          children: <Widget>[
                                            Text('الطابق'),
                                            Container(
                                              width: 100,
                                              child: TextField(
                                                textDirection:
                                                    TextDirection.rtl,
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          color: Colors.grey[500],
                                          width: 1,
                                          height: 50,
                                        ),
                                        Column(
                                          textDirection: TextDirection.rtl,
                                          children: <Widget>[
                                            Text('الشقة'),
                                            Container(
                                              width: 100,
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text('وصف العنوان',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      )),
                                  TextField(
                                      textDirection: TextDirection.rtl,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.location_on),
                                        hintText: 'مثلا وصف العنوان ',
                                        border: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.teal)),
                                      )),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: FlatButton(
                                        onPressed: () {},
                                        color: Colors.black,
                                        child: Text(
                                          'إضافة العنوان',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 100,
                    right: 100,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: Colors.yellow[600],
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MapPage()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('تحديد الموقع'),
                          Icon(Icons.location_on)
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}
