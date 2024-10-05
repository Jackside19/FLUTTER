import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thank You!'),
        centerTitle: true,
        backgroundColor: const Color(0xFF692729), // Matches the color from the image
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'image/thanks.png', // Path to the image in assets
              height: 300,  // Increased height to make the image larger
              width: 200,   // Increased width to make the image larger
            ),
            const SizedBox(height: 20),
            const Text(
              'Thank you for your donation',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'May your deeds be accepted as good deeds and meaningful to others.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF692729), // Background color similar to the image
    );
  }
}
