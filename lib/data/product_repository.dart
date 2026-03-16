import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/product.dart';

class ProductRepository {
  const ProductRepository();

  Future<List<Product>> loadProducts() async {
    final jsonString = await rootBundle.loadString('assets/products.json');
    final List<dynamic> data = json.decode(jsonString) as List<dynamic>;
    return data
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}

