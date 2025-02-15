
import 'dart:io';
import 'package:flutter/material.dart';
import 'prediction_page.dart';

class ImagePreviewPage extends StatelessWidget {
  final String imagePath;

  const ImagePreviewPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Preview Image")),
      body: Column(
        children: [
          Image.file(File(imagePath), height: 300, fit: BoxFit.cover),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PredictionPage(imagePath: imagePath),
                    ),
                  );
                },
                child: const Text("Continue"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
