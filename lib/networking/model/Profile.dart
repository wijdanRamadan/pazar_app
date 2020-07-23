class Profile {
  String email;
  String name;
  String facebookAccountId;
  String phone;
  String firebaseToken;
  String facebookToken;

  Profile(
      {this.email,
      this.name,
      this.phone,
      this.firebaseToken,
      this.facebookAccountId,
      this.facebookToken});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        email: json['id'],
        name: json['name'],
        phone: json['phone'],
        firebaseToken: json['firebase_token'],
        facebookAccountId: json['facebook_account_id'],
        facebookToken: json['facebook_token']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.email;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['firebase_token'] = this.firebaseToken;
    data['facebook_account_id'] = this.facebookAccountId;
    data['facebook_token'] = this.facebookToken;
    return data;
  }
}
final Profile profile=new Profile();