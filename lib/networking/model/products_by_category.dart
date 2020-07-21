
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class ProductsByCategory {
  int id;
  String name;
  String image;
  String textColorHex;
  String backgroundColorHex;
  int sequence;
  List<Products> products;

  ProductsByCategory(
      {this.id,
        this.name,
        this.image,
        this.textColorHex,
        this.backgroundColorHex,
        this.sequence,
        this.products});

  ProductsByCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    textColorHex = json['text_color_hex'];
    backgroundColorHex = json['background_color_hex'];
    sequence = json['sequence'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['text_color_hex'] = this.textColorHex;
    data['background_color_hex'] = this.backgroundColorHex;
    data['sequence'] = this.sequence;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  String name;
  int categoryId;
  int isFeatured;
  int isNew;
  double price;
  double discountPrice;
  String image;
  String thumbnail;
  String description;
  int badge1;
  int badge2;
  int badge3;
  int badge4;
  int isSimple;

  Products(
      {this.id,
        this.name,
        this.categoryId,
        this.isFeatured,
        this.isNew,
        this.price,
        this.discountPrice,
        this.image,
        this.thumbnail,
        this.description,
        this.badge1,
        this.badge2,
        this.badge3,
        this.badge4,
        this.isSimple});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    isFeatured = json['is_featured'];
    isNew = json['is_new'];
    price = json['price'];
    discountPrice = json['discount_price'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    badge1 = json['badge_1'];
    badge2 = json['badge_2'];
    badge3 = json['badge_3'];
    badge4 = json['badge_4'];
    isSimple = json['is_simple'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['is_featured'] = this.isFeatured;
    data['is_new'] = this.isNew;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['image'] = this.image;
    data['thumbnail'] = this.thumbnail;
    data['description'] = this.description;
    data['badge_1'] = this.badge1;
    data['badge_2'] = this.badge2;
    data['badge_3'] = this.badge3;
    data['badge_4'] = this.badge4;
    data['is_simple'] = this.isSimple;
    return data;
  }
}