import 'package:flutter/material.dart';

import '../data/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: cartState,
      builder: (context, _) {
        final items = cartState.items.entries.toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Sepet'),
          ),
          body: items.isEmpty
              ? const Center(
                  child: Text('Sepetiniz boş.'),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: items.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final entry = items[index];
                          final product = entry.key;
                          final quantity = entry.value;

                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(product.imageUrl),
                              ),
                              title: Text(product.name),
                              subtitle: Text(
                                '${product.price.toStringAsFixed(2)} ₺ x $quantity',
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      cartState.removeOne(product);
                                    },
                                  ),
                                  Text('$quantity'),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      cartState.add(product);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        border: Border(
                          top: BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Toplam',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${cartState.totalPrice.toStringAsFixed(2)} ₺',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              showDialog<void>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Simülasyon'),
                                  content: const Text(
                                    'Bu eğitim projesinde gerçek bir ödeme işlemi yoktur.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Tamam'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Text('Satın Al (Simülasyon)'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

