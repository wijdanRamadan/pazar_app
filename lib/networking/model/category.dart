import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Category {
  int id;
  String name;
  String image;
  String textColorHex;
  String backgroundColorHex;
  int sequence;

  Category(
      {this.id,
        this.name,
        this.image,
        this.textColorHex,
        this.backgroundColorHex,
        this.sequence});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    textColorHex = json['text_color_hex'];
    backgroundColorHex = json['background_color_hex'];
    sequence = json['sequence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['text_color_hex'] = this.textColorHex;
    data['background_color_hex'] = this.backgroundColorHex;
    data['sequence'] = this.sequence;
    return data;
  }
}