

class FacebookAuthRequest {
    String COMMENT;
    String default_address;
    String device;
    String email;
    String facebook_account_id;
    String facebook_token;
    String firebase_token;
    String name;
    String phone;
    int region_id;

    FacebookAuthRequest({this.COMMENT, this.default_address, this.device, this.email, this.facebook_account_id, this.facebook_token, this.firebase_token, this.name, this.phone, this.region_id});

    factory FacebookAuthRequest.fromJson(Map<String, dynamic> json) {
        return FacebookAuthRequest(
           COMMENT: json['___________________COMMENT_____'],
            default_address: json['default_address'], 
            device: json['device'], 
            email: json['email'], 
            facebook_account_id: json['facebook_account_id'], 
            facebook_token: json['facebook_token'], 
            firebase_token: json['firebase_token'], 
            name: json['name'], 
            phone: json['phone'], 
            region_id: json['region_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['___________________COMMENT_____'] = this.COMMENT;
        data['default_address'] = this.default_address;
        data['device'] = this.device;
        data['email'] = this.email;
        data['facebook_account_id'] = this.facebook_account_id;
        data['facebook_token'] = this.facebook_token;
        data['firebase_token'] = this.firebase_token;
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['region_id'] = this.region_id;
        return data;
    }
}