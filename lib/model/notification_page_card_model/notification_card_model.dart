import 'package:flutter/material.dart';

class NotificationCardModel {
  String title;
  String description;

  String image;

  NotificationCardModel(
      {@required this.title, @required this.description, this.image});
}

NotificationCardModel cardModel = new NotificationCardModel(
    title: 'جديدنا كل يوم من بازار اب',
    description: 'مرحبا بك في بازار اب',
    image: 'assets/notification_test_image.png');

final List<NotificationCardModel> notificationList = [
  new NotificationCardModel(
      title: 'جديدنا كل يوم من بازار اب', description: 'مرحبا بك في بازار اب'),
  new NotificationCardModel(
      title: 'جديدنا كل يوم من بازار اب', description: 'مرحبا بك في بازار اب'),
  cardModel,
  new NotificationCardModel(
      title: 'جديدنا كل يوم من بازار اب', description: 'مرحبا بك في بازار اب'),
  cardModel,
  new NotificationCardModel(
      title: 'جديدنا كل يوم من بازار اب', description: 'مرحبا بك في بازار اب'),
  new NotificationCardModel(
      title: 'جديدنا كل يوم من بازار اب', description: 'مرحبا بك في بازار اب'),
  cardModel,
  new NotificationCardModel(title: 'hello', description: 'test'),
  new NotificationCardModel(title: 'hello', description: 'test'),
  new NotificationCardModel(title: 'hello', description: 'test'),
  cardModel,
  new NotificationCardModel(title: 'hello', description: 'test'),
];
