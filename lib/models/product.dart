class Product {
  final int id;
  final String name;
  final double price;
  final String category;
  final String imageUrl;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
    );
  }
}

