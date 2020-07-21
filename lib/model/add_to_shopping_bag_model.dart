class ShoppingBagModel {
  String image;
  String productName;
  String price;
  String description;
  int amount;

  ShoppingBagModel(
      this.image, this.productName, this.price, this.description, this.amount);
}

final List<ShoppingBagModel> myShoppingBag = new List<ShoppingBagModel>();
