import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final productImage;
  final String productPrice;
  final String productTitle;
  final double h;

  const CategoryCard({
    super.key,
    required this.productImage,
    required this.h,
    required this.productPrice,
    required this.productTitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Define responsive font sizes based on screen width
    final double titleFontSize = screenSize.width * 0.03; // 4% of screen width
    final double priceFontSize = screenSize.width * 0.025; // 5% of screen width

    return Container(
      height: h, // Dynamic height passed as a parameter
      width: screenSize.width / 2.5,
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
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.network(
                productImage,
                width: double.infinity,
                height: h / 2, // Image height relative to card height
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: screenSize.width, // Make the container fill the parent
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      productTitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            titleFontSize, // Responsive font size for title
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    productPrice,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: priceFontSize, // Responsive font size for price
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
