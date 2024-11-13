import 'package:flutter/material.dart';

import '../provider/dimension_provider.dart';

class ProductCard extends StatelessWidget {
  final productImage;
  final VoidCallback addFunc;
  final String productPrice;
  final String productTitle;
  final double h;

  const ProductCard({
    super.key,
    required this.productImage,
    required this.h,
    required this.productPrice,
    required this.productTitle,
    required this.addFunc,
  });

  @override
  Widget build(BuildContext context) {
    //final screenSize = MediaQuery.of(context).size;
    AppScale scale = AppScale(context);

    // Define responsive font sizes based on screen width
    // final double titleFontSize = screenSize.width * 0.03; // 5% of screen width
    // final double priceFontSize = screenSize.width * 0.025; // 4% of screen width
    // final double buttonFontSize =
    //     screenSize.width * 0.065; // 4.5% of screen width

    return Container(
      height: h, // Dynamic height passed as a parameter
      width: scale.scaledWidth(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.orange, // Set the border color to orange
          width: 2.0, // Set the width of the border
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.network(
                productImage,
                width: double.infinity,
                height: h / 3.2, // Image height relative to card height
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: scale.scaledWidth(1), // Make the container fill the parent
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      productTitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: scale.labelDim /
                            1.3, // Responsive font size for title
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        productPrice,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize:
                              scale.labelDim, // Responsive font size for price
                        ),
                      ),
                      TextButton(
                        onPressed: addFunc,
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: scale.labelDim *
                                1.5, // Responsive font size for button
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
