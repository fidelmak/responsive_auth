import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/products.dart';

// This provider will handle adding the product to Firebase Firestore
final productProvider = Provider((ref) => ProductController());

class ProductController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to add product to Firestore
  Future<void> addProduct(Product product) async {
    try {
      await _firestore.collection('products').add(product.toJson());
    } catch (e) {
      throw Exception("Error adding product: $e");
    }
  }
}
