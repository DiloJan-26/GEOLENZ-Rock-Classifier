import 'package:flutter/material.dart';

class RockIdentificationPage extends StatelessWidget {
  const RockIdentificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rock Identification")),
      body: const Center(
        child: Text(
          "Learn how to identify various rocks.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
