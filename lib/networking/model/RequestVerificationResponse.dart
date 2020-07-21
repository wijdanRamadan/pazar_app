import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RequestVerificationResponse {
    String mobile_number;
    int verification_code;

    RequestVerificationResponse({this.mobile_number, this.verification_code});

    factory RequestVerificationResponse.fromJson(Map<String, dynamic> json) {
        return RequestVerificationResponse(
            mobile_number: json['mobile_number'], 
            verification_code: json['verification_code'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['mobile_number'] = this.mobile_number;
        data['verification_code'] = this.verification_code;
        return data;
    }
}