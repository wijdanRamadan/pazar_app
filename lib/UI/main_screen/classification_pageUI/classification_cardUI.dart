import 'package:flutter/material.dart';
import 'package:pazar_app/networking/model/category.dart';

class ClassificationCard extends StatefulWidget {
  Category _category;

  ClassificationCard(this._category);

  @override
  _ClassificationCardState createState() => _ClassificationCardState();
}

class _ClassificationCardState extends State<ClassificationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          image: DecorationImage(
              image: AssetImage('assets/vegetables.jpg'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.srcOver)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image(
                image: AssetImage('assets/vege_icon.png'),
                width: 32,
                height: 32,
              ),
              Text(
                widget._category.name,
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
