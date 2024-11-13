import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/products.dart'; // Assuming you have a Product model

final apiServiceProvider = Provider<ApiServices>((ref) => ApiServices());

class ApiServices {
  Future<List<Product>> getCategoryProducts(String category) async {
    final response =
        await Dio().get("https://fakestoreapi.com/products/category/$category");

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> getProductById(int id) async {
    try {
      // Fetch the product by its id from API
      final response = await Dio().get('https://fakestoreapi.com/products/$id');

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Decode the JSON and map it to the Product model
        final productData = response.data;
        return Product.fromJson(productData);
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load product');
      }
    } catch (error) {
      // Handle any exceptions that occur during the API call
      throw Exception('Error fetching product: $error');
    }
  }

  Future<List<Product>> getProducts() async {
    // Return a list of products
    try {
      final res = await Dio().get('https://fakestoreapi.com/products');

      // Map the list of JSON objects to a list of Product objects
      List<Product> products = (res.data as List)
          .map((product) => Product.fromJson(product))
          .toList();

      return products;
    } catch (error) {
      throw Exception("Error while fetching products");
    }
  }

  Future<List<Product>> getCategoryJewelery() async {
    // Return a list of products
    try {
      final res = await Dio()
          .get('https://fakestoreapi.com/products/category/jewelery');

      // Map the list of JSON objects to a list of Product objects
      List<Product> products = (res.data as List)
          .map((product) => Product.fromJson(product))
          .toList();

      return products;
    } catch (error) {
      throw Exception("Error while fetching products");
    }
  }

  /// category electronics
  Future<List<Product>> getCategoryElectronics() async {
    // Return a list of products
    try {
      final res = await Dio()
          .get('https://fakestoreapi.com/products/category/electronics');

      // Map the list of JSON objects to a list of Product objects
      List<Product> products = (res.data as List)
          .map((product) => Product.fromJson(product))
          .toList();

      return products;
    } catch (error) {
      throw Exception("Error while fetching products");
    }
  }

  /// category men's clothings
  ///

  Future<List<Product>> getCategoryMenClothing() async {
    // Return a list of products
    try {
      final res = await Dio()
          .get('https://fakestoreapi.com/products/category/men\'s clothing');

      // Map the list of JSON objects to a list of Product objects
      List<Product> products = (res.data as List)
          .map((product) => Product.fromJson(product))
          .toList();

      return products;
    } catch (error) {
      throw Exception("Error while fetching products");
    }
  }

  /// women clothing
  Future<List<Product>> getCategoryWomenClothing() async {
    // Return a list of products
    try {
      final res = await Dio()
          .get('https://fakestoreapi.com/products/category/women\'s clothing');

      // Map the list of JSON objects to a list of Product objects
      List<Product> products = (res.data as List)
          .map((product) => Product.fromJson(product))
          .toList();

      return products;
    } catch (error) {
      throw Exception("Error while fetching products");
    }
  }
}
