import 'package:flutter/material.dart';
import 'card_info_page1.dart';
import 'card_info_page2.dart';
import 'card_info_page3.dart';
import 'card_info_page4.dart'; 
import 'camera_page.dart';// File containing the new pages

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of card items with asset images
    final List<CardItem> items = [
      CardItem(
        assetImage: 'assets/images/rock_collection.jpg',
        title: 'Rocks Collection',
        subtitle: 'Explore the world of rocks',
        page: const RockCollectionPage(),
      ),
      CardItem(
        assetImage: 'assets/images/gemstone_market.jpg',
        title: 'The Global Gemstone Market',
        subtitle: 'Learn about gemstones',
        page: const GemstoneMarketPage(),
      ),
      CardItem(
        assetImage: 'assets/images/rock_identification.jpg',
        title: 'Identifying Rocks',
        subtitle: 'Introduction to identification',
        page: const RockIdentificationPage(),
      ),
      CardItem(
        assetImage: 'assets/images/advanced_analysis.jpg',
        title: 'Advanced Rock Analysis',
        subtitle: 'Deep dive into analysis',
        page: const AdvancedAnalysisPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("GeoLenz Home")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Welcome to GeoLenz!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Recommendation",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 400, // Double the height of the cards
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => item.page),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox(
                      width: 240, // Double the width of the cards
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                            child: Image.asset(
                              item.assetImage,
                              height: 300, // Adjusted height for larger image
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16, // Increased font size
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              item.subtitle,
                              style: const TextStyle(
                                fontSize: 14, // Increased font size
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Text(
                  "Press the button below to identify rocks.",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CameraPage(),
                        ),
                      );
                    },
                    child: const Text("Identify Rocks"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Updated CardItem class to use assetImage
class CardItem {
  final String assetImage;
  final String title;
  final String subtitle;
  final Widget page;

  CardItem({
    required this.assetImage,
    required this.title,
    required this.subtitle,
    required this.page,
  });
}
