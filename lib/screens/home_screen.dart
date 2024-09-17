import 'package:firebase_training/data/data.dart';
import 'package:firebase_training/screens/meals_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> offerImages = [
    '../assets/pages/page1.jpg',
    '../assets/pages/page2.jpg',
    '../assets/pages/pag3.jpg',
  ];

  final _controler = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                textDirection: TextDirection.rtl,
                'العروض:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: PageView.builder(
                controller: _controler,
                itemCount: offerImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        offerImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 12),
              child: SmoothPageIndicator(
                  controller: _controler, // PageController
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 5,
                    activeDotColor: Colors.green,
                  ), // your preferred effect
                  onDotClicked: (index) {}),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                textDirection: TextDirection.rtl,
                'أقسام الوجبات:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.36,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MealsListScreen(
                            item: items[index],
                            nestedItems: items[index]['items']);
                      },
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                              0.1), // Shadow color with lower opacity
                          spreadRadius: 10, // Increase the spread radius
                          blurRadius: 20, // Increase the blur radius
                          offset: const Offset(
                              0, 5), // Increase the vertical offset
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            child: Image.network(
                              items[index]['image_url'],
                              fit: BoxFit.cover,
                              scale: 0.5,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            items[index]['name'],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
