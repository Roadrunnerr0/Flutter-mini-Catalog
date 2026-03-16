import 'package:flutter/foundation.dart';

import '../models/product.dart';

/// Daha gelişmiş sepet state'i:
/// - Toplam ürün adedi
/// - Sepetteki ürünler ve adetleri
/// - Toplam tutar
class CartState extends ChangeNotifier {
  final Map<Product, int> _items = {};

  Map<Product, int> get items => Map.unmodifiable(_items);

  int get totalCount =>
      _items.values.fold<int>(0, (previous, count) => previous + count);

  double get totalPrice => _items.entries.fold<double>(
        0,
        (previous, entry) => previous + entry.key.price * entry.value,
      );

  void add(Product product) {
    _items.update(product, (value) => value + 1, ifAbsent: () => 1);
    notifyListeners();
  }

  void removeOne(Product product) {
    if (!_items.containsKey(product)) return;
    final current = _items[product]!;
    if (current <= 1) {
      _items.remove(product);
    } else {
      _items[product] = current - 1;
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

final CartState cartState = CartState();

