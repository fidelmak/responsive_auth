import '../view/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../const/colors.dart';
import '../provider/cart_provider.dart';
import '../provider/product_provider.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/header.dart';
import '../widgets/product_card.dart';
import '../widgets/section_text.dart';

class CategoryPage extends ConsumerStatefulWidget {
  final String category;
  CategoryPage({required this.category, super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final productRef = ref.watch(categoryProductProvider(widget.category));
    final cartProviderRef = ref.watch(cartProvider.notifier);

    return Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      backgroundColor: MyGlobal.TextWhite,
      appBar: AppBar(
        title: Container(
          child: const Text(
            "BETASTORE",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipOval(
              child: Container(
                color: Colors.white,
                width: 30,
                height: 30,
                child: const Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: MyGlobal.textColor,
        toolbarHeight: 60,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Header(ScreenSize: screenSize),
            Center(
              child: SectionText(
                yourText: "Category",
                more: () {},
                textSize: null,
              ),
            ),
            productRef.when(
              data: (products) {
                return Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: products.map((product) {
                    return SizedBox(
                      width: screenSize.width / 2 - 16,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) =>
                                    ProductPage(productId: product.id),
                              ),
                            );
                          },
                          child: ProductCard(
                            productImage: product.image,
                            productPrice: "\$${product.price.toString()}",
                            productTitle: product.title,
                            h: screenSize.height / 3.2,
                            addFunc: () {
                              cartProviderRef.addProduct(product, context);
                            },
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
              error: (error, _) {
                return Text(error.toString());
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
