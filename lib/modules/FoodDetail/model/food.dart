class Food {
  String name;
  String ingredients;
  String img;
  double price;
  String location;
  String description;
  int qty;

  Food({
    required this.name,
    required this.ingredients,
    required this.img,
    required this.price,
    required this.location,
    required this.description,
    required this.qty
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'],
      ingredients: json['ingredients'],
      img: json['img'],
      price: json['price'],
      location: json['location'],
      description: json['description'],
      qty: json['qty']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ingredients': ingredients,
      'img': img,
      'price': price,
      'location': location,
      'description': description,
      'qty':qty
    };
  }
}
