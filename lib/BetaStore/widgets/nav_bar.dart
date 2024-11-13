import 'package:flutter/material.dart';

import '../view/profile/profile.dart';

class EcomNavbar extends StatelessWidget {
  const EcomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Added padding for the navbar
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Distributes space evenly
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: const Text(
              "BETASTORE",
              style: TextStyle(color: Colors.white),
            ),
          ),

          // Container(
          //   child: Image.asset(
          //     "assets/images/amazon_logo.png",
          //     fit: BoxFit.cover,
          //     width: 150,
          //     height: 150,
          //   ),
          // ),
          Container(
            color: Colors.black,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white, // Set icon color to white
              ),
            ),
          )
        ],
      ),
    );
  }
}
