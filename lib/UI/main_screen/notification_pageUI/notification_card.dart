import 'package:flutter/material.dart';
import 'package:pazar_app/model/notification_page_card_model/notification_card_model.dart';

class NotificationCard extends StatefulWidget {
  NotificationCardModel cardModel;

  NotificationCard(this.cardModel);

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                widget.cardModel.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Text(
                widget.cardModel.description,
                style: TextStyle(fontSize: 15.0),
              ),
              if (widget.cardModel.image != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Image(
                      image: AssetImage(widget.cardModel.image),
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              Divider(
                height: 30.0,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
