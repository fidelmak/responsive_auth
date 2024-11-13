import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/products.dart';
import '../services/api_service.dart';

// All products provider
final ProductFutureProvider = FutureProvider<List<Product>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getProducts();
});

// Jewelry provider
final productJeweleryProvider = FutureProvider<List<Product>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getCategoryJewelery();
});

// Single product provider by ID
final productProvider = FutureProvider.family<Product, int>((ref, id) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getProductById(id);
});

// Women's clothing provider
final productWomenClothingProvider = FutureProvider<List<Product>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getCategoryWomenClothing();
});

// Men's clothing provider
final productMenClothingProvider = FutureProvider<List<Product>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getCategoryMenClothing();
});

// Electronics provider
final productElectronicsProvider = FutureProvider<List<Product>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getCategoryElectronics();
});
// category provider

final categoryProductProvider =
    FutureProvider.family<List<Product>, String>((ref, category) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getCategoryProducts(category);
});
