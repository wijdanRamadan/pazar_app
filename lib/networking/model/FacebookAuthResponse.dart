
class FacebookAuthResponse {
    String api_token;
    String default_address;
    String device;
    String email;
    String facebook_account_id;
    String last_seen;
    String name;
    String phone;
    int region_id;

    FacebookAuthResponse({this.api_token, this.default_address, this.device, this.email, this.facebook_account_id, this.last_seen, this.name, this.phone, this.region_id});

    factory FacebookAuthResponse.fromJson(Map<String, dynamic> json) {
        return FacebookAuthResponse(
            api_token: json['api_token'], 
            default_address: json['default_address'], 
            device: json['device'], 
            email: json['email'], 
            facebook_account_id: json['facebook_account_id'], 
            last_seen: json['last_seen'], 
            name: json['name'], 
            phone: json['phone'], 
            region_id: json['region_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['api_token'] = this.api_token;
        data['default_address'] = this.default_address;
        data['device'] = this.device;
        data['email'] = this.email;
        data['facebook_account_id'] = this.facebook_account_id;
        data['last_seen'] = this.last_seen;
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['region_id'] = this.region_id;
        return data;
    }
}