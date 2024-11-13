import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../provider/cart_provider.dart';
import '../../provider/state_notifiers.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../../widgets/custom_button.dart';

class CartPage extends ConsumerStatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final delCart = ref.read(cartProvider.notifier);
    final screenSize = MediaQuery.of(context).size;

    void onItemTapped(int index) {
      ref.read(navigationProvider.notifier).navigate(index);
      switch (index) {
        case 0:
          context.go('/');
          break;
        case 1:
          context.go('/cart');
          break;
        case 2:
          context.go('/cart');
          break;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomNavBar(),
      appBar: AppBar(
        title: const Text('Your Cart', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: cart.isEmpty
          ? const Center(
              child: Text('Your cart is empty'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final product = cart[index];
                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: ListTile(
                          leading: Image.network(
                            product.image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(product.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('\$${product.price}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle_outline,
                                color: Colors.red),
                            onPressed: () {
                              delCart.removeProduct(product, context);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: screenSize.width / 1.2,
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${delCart.totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButton(
                    desireColor: Colors.orange.withOpacity(0.6),
                    screenSize: screenSize,
                    text: 'Buy',
                    onPressed: () {
                      // Handle Buy button action
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
