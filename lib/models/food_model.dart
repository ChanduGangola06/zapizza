class FoodModel {
  final String productName;
  final String description;
  final String catgoryName;
  final num productPrice;
  final List imageUrl;
  final String storeId;
  int quantity;
  final String productId;
  final String productSize;
  final num discount;

  FoodModel(
      {required this.productName,
      required this.productPrice,
      required this.catgoryName,
      required this.imageUrl,
      required this.quantity,
      required this.productId,
      required this.productSize,
      required this.discount,
      required this.description,
      required this.storeId});
}
