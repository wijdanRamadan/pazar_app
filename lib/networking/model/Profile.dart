import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Profile {
  String facebookAccountId;
  String name;

  Profile({this.facebookAccountId, this.name});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      facebookAccountId: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.facebookAccountId;
    data['name'] = this.name;
    return data;
  }
}
