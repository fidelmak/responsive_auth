import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../const/colors.dart';
import '../provider/cart_provider.dart';
import '../provider/dimension_provider.dart';
import '../provider/product_provider.dart';
import '../provider/state_notifiers.dart';
import '../widgets/category_card.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/header.dart';
import '../widgets/section_text.dart';
import 'category_page.dart';
import 'product_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Search Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    ref.read(navigationProvider.notifier).navigate(index);
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/cart');
        break;
      case 2:
        context.go('/history');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProviderRef = ref.watch(cartProvider.notifier);
    final screenSize = MediaQuery.of(context).size;
    final ProductRef = ref.watch(ProductFutureProvider);
    final ProductElectronics = ref.watch(productElectronicsProvider);
    final ProductMen = ref.watch(productMenClothingProvider);
    final ProductJewery = ref.watch(productJeweleryProvider);
    final ProductWomen = ref.watch(productWomenClothingProvider);
    final screenIndex = ref.watch(navigationProvider);

    AppScale scale = AppScale(context);

    return Scaffold(
      backgroundColor: MyGlobal.TextWhite,
      bottomNavigationBar: const CustomNavBar(),
      appBar: AppBar(
        title: Text(
          "BETASTORE",
          style: TextStyle(
            fontSize: scale.labelDim * 2,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                context.go("/profile");
              },
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
          ),
        ],
        backgroundColor: MyGlobal.textColor,
        toolbarHeight: 60,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Header(ScreenSize: screenSize),
            Center(
                child: SectionText(
              yourText: "Jewelery",
              more: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => CategoryPage(category: 'jewelery'),
                  ),
                );
              },
              textSize: null,
            )),
            ProductJewery.when(
              data: (products) {
                var twoProducts = products.take(2).toList();
                return Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: twoProducts.map((product) {
                    return SizedBox(
                      width: screenSize.width / 2 - 16,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                          child: CategoryCard(
                            productImage: product.image,
                            productPrice: "\$${product.price.toString()}",
                            productTitle: product.title,
                            h: screenSize.height / 4,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
              error: (error, _) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
            // Repeat similar structure for other sections and products (Men's Clothing, Electronics, Women's Clothing, All Products)
          ],
        ),
      ),
    );
  }
}
