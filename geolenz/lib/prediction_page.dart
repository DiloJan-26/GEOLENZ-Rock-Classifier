import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'second_prediction_page.dart';

class PredictionPage extends StatefulWidget {
  final String imagePath;

  const PredictionPage({super.key, required this.imagePath});

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  String label = "Loading...";
  double confidence = 0.0;
  bool isLoading = true;
  List<dynamic>? recognitions;

  @override
  void initState() {
    super.initState();
    _loadModelAndPredict();
  }

  Future<void> _loadModelAndPredict() async {
    // Load the TFLite model
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/label.txt",
    );

    // Run the prediction
    recognitions = await Tflite.runModelOnImage(
      path: widget.imagePath, // Path to the image
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2, // Get top 2 predictions
      threshold: 0.2, // Confidence threshold
    );

    // Handle recognition results
    if (recognitions != null && recognitions!.isNotEmpty) {
      setState(() {
        label = recognitions![0]['label'];
        confidence = recognitions![0]['confidence'] * 100;
        isLoading = false;
      });
    } else {
      setState(() {
        label = "Prediction Failed";
        confidence = 0.0;
        isLoading = false;
      });
    }

    // Close the TFLite model when done
    await Tflite.close();
  }

  String getClassDescription(String label) {
    switch (label.toLowerCase()) {
      case "charnockite":
        return "Type: Metamorphic Rock\n      "
            "Hardness: 6-7 on the Mohs scale\n\n"
            "Charnockite is found in high-grade metamorphic terrains, often associated with granulite facies rocks. It's commonly found in areas with a history of deep crustal metamorphism. ";

      case "granite":
        return "Type: Igneous Rock\n      "
            "Hardness: 7 on the Mohs scale\n\n"
            "Granite is widely distributed throughout the Earth's crust and is commonly found in continental crust regions. It forms the core of many mountain ranges and is abundant in areas with a history of tectonic activity. ";

      case "limestone":
        return "Type: Sedimentary Rock\n      "
            "Hardness: 3 on the Mohs scale\n\n"
            "Limestone is a sedimentary rock that forms from the accumulation of calcium carbonate, often from marine organisms. It is commonly found in shallow marine environments, caves, and karst landscapes. ";

      case "marble":
        return "Type: Metamorphic Rock\n      "
            "Hardness: 3 on the Mohs scale\n\n"
            "Marble forms from the metamorphism of limestone or dolomite. It is commonly found in mountain ranges and areas with a history of tectonic activity. ";

      case "quartzite":
        return "Type: Metamorphic Rock\n      "
            "Hardness: 7 on the Mohs scale\n\n"
            "Quartzite is formed from the metamorphism of quartz-rich sandstone. It is commonly found in mountain ranges and areas with significant geological uplift. ";

      case "sandstone":
        return "Type: Sedimentary Rock\n      "
            "Hardness: 6-7 on the Mohs scale\n\n"
            "Sandstone is a sedimentary rock that forms from the accumulation and lithification of sand-sized particles. It is commonly found in sedimentary basins, riverbeds, and deserts. ";

      case "out of class object":
        return "The object does not match any of the known classes.";
      default:
        return "No description available for this class.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Prediction Page")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
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
                      File(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Display the prediction label
                  Text(
                    "Predicted Class: $label",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Display the confidence level
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
                  const SizedBox(height: 20),
                  // Next Confidence Prediction button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPredictionPage(
                            imagePath: widget.imagePath,
                            recognitions: recognitions,
                          ),
                        ),
                      );
                    },
                    child: const Text("Next Confidence Prediction"),
                  ),
                ],
              ),
            ),
    );
  }
}
