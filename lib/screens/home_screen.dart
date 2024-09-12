import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> offerImages = [
    'https://res.cloudinary.com/daily-now/image/upload/f_auto,q_auto/v1/posts/20941486b0c8dd9e41aaa905d541f812',
    'https://res.cloudinary.com/daily-now/image/upload/f_auto,q_auto/v1/posts/0c3145c660789f310928f883581515cd',
    'https://res.cloudinary.com/daily-now/image/upload/f_auto,q_auto/v1/posts/e0fadac00347316f951e8cc926a814eb',
  ];

  final List<String> items = [
    'مشويات',
    'مقبلات',
    'مندي',
    'بركر',
    'بيتزا',
    'ريزو',
    'عصائر',
    'معجنات',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مطعم شيف المندي'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                textDirection: TextDirection.rtl,
                'العروض:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: PageView.builder(
                itemCount: offerImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        offerImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                textDirection: TextDirection.rtl,
                'الوجبات:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.36,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'mealsListScreen');
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
                          offset: Offset(0, 5), // Increase the vertical offset
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          // height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            child: Image.network(
                              'https://th.bing.com/th/id/OIP.FZapWecx1VvgfBZlI_MdtQAAAA',
                              fit: BoxFit.cover,
                              scale: 0.5,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            items[index],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
