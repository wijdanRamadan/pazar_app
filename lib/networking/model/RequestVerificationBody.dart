import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RequestVerificationBody {
    String phone;

    RequestVerificationBody({@required this.phone});

    factory RequestVerificationBody.fromJson(Map<String, dynamic> json) {
        return RequestVerificationBody(
            phone: json['phone'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['phone'] = this.phone;
        return data;
    }
}