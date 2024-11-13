import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/stream/user_product_view.dart';
import '../../widgets/category_card.dart';
import 'widget/user_custom_bar.dart';

class UserProductPage extends ConsumerStatefulWidget {
  const UserProductPage({Key? key}) : super(key: key);

  @override
  _UserProductPageState createState() => _UserProductPageState();
}

class _UserProductPageState extends ConsumerState<UserProductPage> {
  @override
  Widget build(BuildContext context) {
    final productsAsyncValue = ref.watch(userViewProvider);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const UserCustomNavBar(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("My Products"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal Scroll View for Categories
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              child: _buildCategoryScrollView(),
            ),
            const SizedBox(height: 10), // Space between categories and products

            // User Created Products Section
            productsAsyncValue.when(
              data: (products) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  spacing: 8.0, // Horizontal spacing between items
                  runSpacing: 8.0, // Vertical spacing between rows
                  children: products.map((product) {
                    return SizedBox(
                      width: screenSize.width / 2 - 16, // 2 products per row
                      child: CategoryCard(
                        productImage: product.image,
                        productPrice: "\$${product.price.toString()}",
                        productTitle: product.title,
                        h: screenSize.height / 4, // Adjust card height
                      ),
                    );
                  }).toList(),
                ),
              ),
              error: (error, _) => Center(child: Text("Error: $error")),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryScrollView() {
    const categories = ['All', 'Electronics', 'Fashion', 'Groceries'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              category,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          );
        }).toList(),
      ),
    );
  }
}
