class FoodModel {
  String? id;
  String? name;
  String? category;
  String? imageUrl;
  String? price;

  FoodModel({
    this.id,
    this.name,
    this.category,
    this.imageUrl,
    this.price,
  });

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    imageUrl = json['image_url'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'image_url': imageUrl,
        'price': price,
      };
}
