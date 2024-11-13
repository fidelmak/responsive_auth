import 'package:flutter/material.dart';

import '../const/colors.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.ScreenSize,
  });

  final Size ScreenSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background color split into two parts: black and white
        Column(
          children: [
            Container(
              height: ScreenSize.height / 32,
              // Black top half
              color: Colors.black,
            ),
            Container(
              height: ScreenSize.height / 32, // White bottom half
              color: MyGlobal.TextWhite,
            ),
          ],
        ),
        // Centered search widget
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Light black shadow
                  spreadRadius: 2, // How wide the shadow spreads
                  blurRadius: 5, // How blurry the shadow is
                  offset: const Offset(
                      0, 4), // The direction and amount of the shadow
                ),
              ],
            ),
            width: ScreenSize.width / 1.2,
            height: ScreenSize.height / 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.black,
                  onPressed: () {
                    // Search action when icon is pressed
                  },
                ),
                const Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black, // Black input text color
                    ),
                    decoration: InputDecoration(
                      hintText: 'What are you looking for',
                      hintStyle:
                          TextStyle(color: Colors.grey), // Hint text color
                      border: InputBorder.none, // Removes default underline
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt_outlined),
                  color: Colors.black,
                  onPressed: () {
                    // Action for camera icon press
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
