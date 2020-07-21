import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pazar_app/networking/api_services.dart';
import 'package:pazar_app/networking/model/category.dart';

import 'classification_cardUI.dart';

class ClassificationUI extends StatefulWidget {
  @override
  _ClassificationUIState createState() => _ClassificationUIState();
}

class _ClassificationUIState extends State<ClassificationUI> {
  List<Category> categories = List<Category>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final dio = Dio(); // Provide a dio instance
    dio.options.headers["Demo-Header"] =
        "demo header"; // config your dio headers globally
    final client = ApiClient(dio);

    // client.getCategories().then((it) => categories=it);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(90.0, 0.0, 90.0, 0.0),
          child: Row(
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
        centerTitle: true,
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.black,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: CustomScrollView(slivers: <Widget>[
            SliverToBoxAdapter(
                child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(child: Text('كل الماركات')),
                    Text(
                      'الماركات',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )),
            SliverToBoxAdapter(
                child: Container(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return new Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      'https://via.placeholder.com/150'),
                                ),
                              ),
                              Text(
                                'test',
                                style: TextStyle(fontSize: 10.0),
                              )
                            ],
                          );
                        }))),
            SliverToBoxAdapter(
                child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      child: Text('كل التصنيفات'),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/allClassifications',
                            arguments: {'categories': categories});
                      },
                    ),
                    Text(
                      'التصنيفات',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )),
            SliverGrid(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              delegate: SliverChildListDelegate(
                _getClassificationCards(categories),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

List<Widget> _getAvatars() {
  List<Widget> widgets = List<Widget>();

  for (int i = 0; i < 30; i++) {
    widgets.add(new Column(
      children: <Widget>[
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/test.png'),
        ),
        Text('test')
      ],
    ));
  }

  return widgets;
}

List<Widget> _getClassificationCards(List<Category> categories) {
  List<Widget> widgets = List<Widget>();
  for (int i = 0; i < categories.length; i++) {
    widgets.add(ClassificationCard(categories[i]));
  }

  return widgets;
}
