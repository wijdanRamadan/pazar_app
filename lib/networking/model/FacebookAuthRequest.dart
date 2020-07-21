import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FacebookAuthRequest {
    String device;
    String facebook_account_id;
    String facebook_token;
    String firebase_token;
    String name;

    FacebookAuthRequest({this.device, this.facebook_account_id, this.facebook_token, this.firebase_token, this.name});

    factory FacebookAuthRequest.fromJson(Map<String, dynamic> json) {
        return FacebookAuthRequest(
            device: json['device'], 
            facebook_account_id: json['facebook_account_id'], 
            facebook_token: json['facebook_token'], 
            firebase_token: json['firebase_token'], 
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['device'] = this.device;
        data['facebook_account_id'] = this.facebook_account_id;
        data['facebook_token'] = this.facebook_token;
        data['firebase_token'] = this.firebase_token;
        data['name'] = this.name;
        return data;
    }
}