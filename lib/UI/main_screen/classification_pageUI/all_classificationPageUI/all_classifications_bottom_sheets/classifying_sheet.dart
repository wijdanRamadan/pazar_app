import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:pazar_app/networking/model/category.dart';

class ClassifyingSheet extends StatefulWidget {
  List<Category> categories;
  bool isSelected = false;

  ClassifyingSheet(this.categories);

  @override
  _ClassifyingSheetState createState() => _ClassifyingSheetState();
}

class _ClassifyingSheetState extends State<ClassifyingSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
              child: Text(
                'التصنيفات',
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
            ),
            Expanded(
                child: Container(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverStickyHeader(
                    header: Container(
                      decoration: new BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey[400],
                            offset: new Offset(1.0, 1.0),
                          )
                        ],
                        color: Colors.white,
                      ),
                      height: 60.0,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'الماركات',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, i) => ListTile(
                          title:
                              Row(textDirection: TextDirection.rtl, children: [
                            Text(
                              widget.categories[i].name,
                              textDirection: TextDirection.rtl,
                            )
                          ]),
                          onTap: () {},
                        ),
                        childCount: widget.categories.length,
                      ),
                    ),
                  ),
                  SliverStickyHeader(
                    header: Container(
                      decoration: new BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey[400],
                            offset: new Offset(1.0, 1.0),
                          )
                        ],
                        color: Colors.white,
                      ),
                      height: 60.0,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'التصنيفات',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, i) => ListTile(
                          title: Text(
                            widget.categories[i].name,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        childCount: widget.categories.length,
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
