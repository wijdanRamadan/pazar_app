import 'package:flutter/material.dart';
import 'package:pazar_app/UI/for_sale_item_card.dart';
import 'package:pazar_app/appDesign/all_classification_design.dart';
import 'package:pazar_app/model/home_page_content.dart';
import 'package:pazar_app/networking/model/category.dart';

import 'all_classifications_bottom_sheets/classifying_sheet.dart';
import 'all_classifications_bottom_sheets/ordering_sheet.dart';

class AllClassifications extends StatefulWidget {
  @override
  _AllClassificationsState createState() => _AllClassificationsState();
}

class _AllClassificationsState extends State<AllClassifications> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  AllClassificationDesign _design = AllClassificationDesign();

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    List<Category> categories = data['categories'];

    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBar(
          flexibleSpace: Container(
            color: Colors.yellow[600],
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0))),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(20.0))),
                            ),
                          ),
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
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          scaffoldKey.currentState.showBottomSheet((context) =>
                              Container(child: ClassifyingSheet(categories)));
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.filter_list),
                            Text(
                              _design.classifications,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 50,
                        color: Colors.black,
                      ),
                      FlatButton(
                        onPressed: () {
                          scaffoldKey.currentState
                              .showBottomSheet((context) => Container(
                                    child: OrderingSheet(),
                                    height: 320,
                                  ));
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.filter_list),
                            Text(
                              _design.ordering,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return FlatButton(
                        child: Text('test'),
                        onPressed: () {},
                        focusColor: Colors.amber,
                      );
                    },
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                delegate: SliverChildListDelegate(_getAllClassificationCards()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getAllClassificationCards() {
    List<Widget> widgets = List<Widget>();

    for (int i = 0; i < contentList.length; i++) {
      widgets.add(new ForSaleItemCard(contentList[i].cards, i));
    }

    return widgets;
  }
}
