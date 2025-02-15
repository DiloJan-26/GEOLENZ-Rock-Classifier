import 'dart:io';
import 'package:flutter/material.dart';

class SecondPredictionPage extends StatelessWidget {
  final String imagePath;
  final List<dynamic>? recognitions;

  const SecondPredictionPage({
    super.key,
    required this.imagePath,
    required this.recognitions,
  });

  String getClassDescription(String label) {
    switch (label.toLowerCase()) {
      case "charnockite":
        return "Type: Metamorphic Rock\n      "
            "Hardness: 6-7 on the Mohs scale\n\n"
            "Charnockite is found in high-grade metamorphic terrains, often associated with granulite facies rocks. It's commonly found in areas with a history of deep crustal metamorphism. "
            "It is also used as a decorative stone in countertops, flooring, and other surfaces.";
      case "granite":
        return "Type: Igneous Rock\n      "
            "Hardness: 7 on the Mohs scale\n\n"
            "Granite is widely distributed throughout the Earth's crust and is commonly found in continental crust regions. It forms the core of many mountain ranges and is abundant in areas with a history of tectonic activity. "
            "Granite is a common type of igneous rock known for its strength and decorative use.";
      case "limestone":
        return "Type: Sedimentary Rock\n      "
            "Hardness: 3 on the Mohs scale\n\n"
            "Limestone is a sedimentary rock that forms from the accumulation of calcium carbonate, often from marine organisms. It is commonly found in shallow marine environments, caves, and karst landscapes. "
            "It is also used as a raw material in the production of cement, glass, and other products.";
      case "marble":
        return "Type: Metamorphic Rock\n      "
            "Hardness: 3 on the Mohs scale\n\n"
            "Marble forms from the metamorphism of limestone or dolomite. It is commonly found in mountain ranges and areas with a history of tectonic activity. "
            "Marble is a metamorphic rock prized for its beauty and use in sculptures and architecture.";
      case "quartzite":
        return "Type: Metamorphic Rock\n      "
            "Hardness: 7 on the Mohs scale\n\n"
            "Quartzite is formed from the metamorphism of quartz-rich sandstone. It is commonly found in mountain ranges and areas with significant geological uplift. "
            "Quartzite is a hard, non-foliated metamorphic rock derived from sandstone.";
      case "sandstone":
        return "Type: Sedimentary Rock\n      "
            "Hardness: 6-7 on the Mohs scale\n\n"
            "Sandstone is a sedimentary rock that forms from the accumulation and lithification of sand-sized particles. It is commonly found in sedimentary basins, riverbeds, and deserts. "
            "Sandstone is a common type of sedimentary rock used in construction and as a building material.";
      case "out of class object":
        return "The object does not match any of the known classes.";
      default:
        return "No description available for this class.";
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ensure recognitions are valid and have at least two predictions
    if (recognitions == null || recognitions!.length < 2) {
      return Scaffold(
        appBar: AppBar(title: const Text("Second Prediction Page")),
        body: const Center(
          child: Text(
            "Second Prediction Not Available",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    // Get the second prediction
    final secondPrediction = recognitions![1];
    final label = secondPrediction['label'];
    final confidence = secondPrediction['confidence'] * 100;

    return Scaffold(
      appBar: AppBar(title: const Text("Second Prediction Page")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          // Display the image
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.file(
              File(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          // Display the second prediction label
          Text(
            "Second Predicted Class: $label",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Display the second confidence level
          Text(
            "Confidence: ${confidence.toStringAsFixed(2)}%",
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          // Display the class description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              getClassDescription(label),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
