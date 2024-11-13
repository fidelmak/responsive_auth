import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.screenSize,
    required this.text,
    required this.onPressed,
    this.desireColor,
  });
  final desireColor;
  final Size screenSize;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: desireColor, // Set background color to white
        foregroundColor: Colors.white, // Set text color to orange
        side: const BorderSide(
            color: Colors.white, width: 2), // Add orange border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Set border radius to 12
        ),
        fixedSize: Size(
            screenSize.width / 1.2, 50), // Set the button's width and height
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16), // Adjust text size if needed
      ),
    );
  }
}
