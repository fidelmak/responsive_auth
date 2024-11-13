import 'package:flutter/material.dart';

class SectionText extends StatelessWidget {
  final VoidCallback more;
  final String yourText;
  const SectionText({
    super.key,
    required this.yourText,
    required this.more,
    required textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Use spaceBetween to spread out
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            yourText,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black54,
              size: 16,
            ),

            onPressed: more, // Set icon color to white
          ),
        ],
      ),
    );
  }
}
