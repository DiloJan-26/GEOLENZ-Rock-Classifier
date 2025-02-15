import 'package:flutter/material.dart';

class GemstoneMarketPage extends StatelessWidget {
  const GemstoneMarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gemstone Market")),
      body: const Center(
        child: Text(
          "Discover the global gemstone market.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
