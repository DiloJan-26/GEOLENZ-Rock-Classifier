import 'package:flutter/material.dart';

class RockCollectionPage extends StatelessWidget {
  const RockCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rock Collection")),
      body: const Center(
        child: Text(
          "Explore and manage your rock collection here.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
