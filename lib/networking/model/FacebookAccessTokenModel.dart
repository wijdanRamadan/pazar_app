import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FacebookAccessTokenModel {
    String access_token;

    FacebookAccessTokenModel({
        @required this.access_token});

    factory FacebookAccessTokenModel.fromJson(Map<String, dynamic> json) {
        return FacebookAccessTokenModel(
            access_token: json['access_token'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['access_token'] = this.access_token;
        return data;
    }
}