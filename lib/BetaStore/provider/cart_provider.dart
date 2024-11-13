import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/products.dart';

class CartStateNotifier extends StateNotifier<List<Product>> {
  CartStateNotifier() : super([]);

  void addProduct(Product product, BuildContext context) {
    // Add product to state
    state = [...state, product];

    // Show SnackBar indicating successful addition
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.title} has been added to your cart!'),
        duration: const Duration(seconds: 2), // Duration of the SnackBar
        backgroundColor: Colors.orangeAccent, // You can customize the color
      ),
    );
  }

  void removeProduct<List>(Product product, BuildContext context) {
    state = state.where((p) => p != product).toList();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.title} has been removed from your cart!'),
        duration: const Duration(seconds: 2), // Duration of the SnackBar
        backgroundColor: Colors.orangeAccent, // You can customize the color
      ),
    );
  }

  double get totalPrice {
    return state.fold(0, (total, current) => total + (current.price * 1));
  }

  void clearCart() {
    state = [];
  }
}

final cartProvider =
    StateNotifierProvider<CartStateNotifier, List<Product>>((ref) {
  return CartStateNotifier();
});
