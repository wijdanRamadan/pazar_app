

import 'package:flutter/material.dart';

class AllClassificationsAppBar extends StatefulWidget {
  @override
  _AllClassificationsAppBarState createState() => _AllClassificationsAppBarState();
}

class _AllClassificationsAppBarState extends State<AllClassificationsAppBar> {
  @override
  Widget build(BuildContext context) {
    
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[

                    Expanded(
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius:  const BorderRadius.all(
                              const Radius.circular(10.0))
                        ),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),


                            ),
                          ),),
                      ),

                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.keyboard_tab),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.filter_list),
                        Text('التصنيفات' ,style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0
                        ),)
                      ],
                    ),
                    VerticalDivider(color: Colors.black,
                      thickness: 2, width: 20,
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.filter_list),
                        Text('الترتيب' ,style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0
                        ),)
                      ],

                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );


  }
}
