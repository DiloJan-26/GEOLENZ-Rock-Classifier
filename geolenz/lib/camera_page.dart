import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'prediction_page.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => PredictionPage(imagePath: pickedFile.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Capture or Select an Image")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Snap Tips Section
            const Text(
              "Snap Tips",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                _buildSnapTip(
                  imagePath: 'assets/images/snap_tip_center.png',
                  description: "Place the rock in the center of the frame.",
                ),
                const SizedBox(height: 30),
                _buildSnapTip(
                  imagePath: 'assets/images/snap_tip_well_lit.png',
                  description:
                      "Make sure the rock is well-lit and the image isn’t blurry.",
                ),
                const SizedBox(height: 30),
                _buildSnapTip(
                  imagePath: 'assets/images/snap_tip_clear.png',
                  description: "Take a clear picture without dark spots.",
                ),
                const SizedBox(height: 30),
                _buildSnapTip(
                  imagePath: 'assets/images/snap_tip_fit_frame.png',
                  description:
                      "Stand as close to the rock as you can, checking that it fits in the frame.",
                ),
                const SizedBox(height: 30),
                _buildSnapTip(
                  imagePath: 'assets/images/snap_tip_one_rock.png',
                  description:
                      "For more accurate recognition, make sure the picture features only one rock.",
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Capture and Select Buttons
            Center(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(context, ImageSource.camera),
                    icon: const Icon(Icons.camera),
                    label: const Text("Capture Image"),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(context, ImageSource.gallery),
                    icon: const Icon(Icons.photo),
                    label: const Text("Select from Gallery"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build individual snap tips
  Widget _buildSnapTip(
      {required String imagePath, required String description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
