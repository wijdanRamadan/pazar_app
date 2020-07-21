import 'package:flutter/material.dart';
import 'package:pazar_app/appDesign/introductory_ui_design.dart';
import 'package:pazar_app/model/introductory_slide.dart';

class IntroductorySlideItem extends StatelessWidget {
  IntroductoryDesign _design = IntroductoryDesign();

  int index;

  IntroductorySlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 30.0),
          child: Image(
            image: AssetImage(slideList[index].image),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            slideList[index].description,
            style: TextStyle(
              color: _design.slideTextColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(slideList[index].description1,
            style: TextStyle(
              color: _design.slideTextColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }
}
