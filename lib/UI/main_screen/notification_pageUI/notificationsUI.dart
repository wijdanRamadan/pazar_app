import 'package:flutter/material.dart';
import 'package:pazar_app/model/notification_page_card_model/notification_card_model.dart';

import 'notification_card.dart';

class NotificationsUI extends StatefulWidget {
  @override
  _NotificationsUIState createState() => _NotificationsUIState();
}

class _NotificationsUIState extends State<NotificationsUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (context, index) =>
                NotificationCard(notificationList[index]),
            scrollDirection: Axis.vertical,
            itemCount: notificationList.length,
          ),
        ),
      ),
    );
  }
}
