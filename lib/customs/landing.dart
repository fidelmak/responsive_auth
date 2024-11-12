import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          child: Row(
            children: [
              Container(width: 0.25.sw, height: 200.h, color: Colors.white),
              Container(width: 0.25.sw, height: 200.h, color: Colors.black),
            ],
          ),
        ),
        Row(
          children: [const Text("On"), const Text("BAG")],
        ),
        const Center(
            child: Text("You need to hop on this promo for better deals "))
      ]),
    );
  }
}
