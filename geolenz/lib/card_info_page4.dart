import 'package:flutter/material.dart';

class AdvancedAnalysisPage extends StatelessWidget {
  const AdvancedAnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Advanced Rock Analysis")),
      body: const Center(
        child: Text(
          "Deep dive into advanced rock analysis techniques.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
