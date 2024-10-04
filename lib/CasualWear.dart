import 'dart:async'; // Import this for Timer
import 'package:flutter/material.dart';
import 'package:mad_sprinklez_final/home.dart';
import 'package:mad_sprinklez_final/myOrders.dart';
import 'package:mad_sprinklez_final/cart.dart';
import 'package:mad_sprinklez_final/profile.dart';
import 'package:mad_sprinklez_final/itemdetails.dart'; // Import the ItemDetailsPage

class CasualWearPage extends StatefulWidget {
  @override
  _CasualWearPageState createState() => _CasualWearPageState();
}

class _CasualWearPageState extends State<CasualWearPage> {
  late PageController _pageController; // Correct variable name here
  int _currentPage = 0;
  int _currentIndex = 0; // Set the index to 1 as this page represents Casual Wear

  final List<Widget> _pages = [
    HomePage(), // Home Page
    CasualWearPage(), // Current page (Casual Wear)
    MyOrdersPage(), // Orders Page
    ShoppingCartPage(), // Cart Page
    Profile(), // Profile Page
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0); // Correct variable name here
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {  // Adjusted to 2 to allow cycling through all three images
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose the page controller properly
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SingleChildScrollView(
            child: Center( // Wrap content in a Center widget to align it in the middle of the screen
              child: Container(
                width: orientation == Orientation.landscape ? 600 : double.infinity, // Restrict width in landscape
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'Casual Wear',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 16),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.pink[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 200,
                              child: PageView(
                                controller: _pageController, // Use the correct controller
                                children: [
                                  bannerItem('Assets/Images/banner2.png'),
                                  bannerItem('Assets/Images/banner3.png'),
                                  bannerItem('Assets/Images/banner4.png'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: categoryItem(
                            'Kaftan\n4200.00',
                            'Assets/Images/kaftan.jpeg',
                            'Kaftan',
                            'Casual Wear',
                            4200.00,
                            orientation,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: categoryItem(
                            'Basic T-shirt\n2680.00',
                            'Assets/Images/basicT.jpg',
                            'Basic T-shirt',
                            'Casual Wear',
                            2680.00,
                            orientation,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: categoryItem(
                            'Denim Short\n3620.00',
                            'Assets/Images/short.jpg',
                            'Denim Short',
                            'Casual Wear',
                            3620.00,
                            orientation,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: categoryItem(
                            'Linen Short Frock\n5420.00',
                            'Assets/Images/casual.jpeg',
                            'Linen Short Frock',
                            'Casual Wear',
                            5420.00,
                            orientation,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar( // Navigation bar
        currentIndex: _currentIndex, // Set the current selected index
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.pink[100],
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update current index
          });
          Navigator.push( // Navigate based on selected index
            context,
            MaterialPageRoute(builder: (context) => _pages[index]),
          );
        },
        items: [
          BottomNavigationBarItem( // Adding icons to the bottom nav bar
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long), // Changed to orders icon
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '',
          ),
        ],
      ),
    );
  }

  // Modified categoryItem to navigate to ItemDetailsPage
  Widget categoryItem(String label, String imageUrl, String itemName, String category, double price, Orientation orientation) {
    return GestureDetector(
      onTap: () {
        // Navigate to ItemDetailsPage when the user taps on this item
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailsPage(
              itemName: itemName,  // Pass the item name
              category: category,  // Pass the category
              price: price,        // Pass the price
              imageUrl: imageUrl,  // Pass the image URL
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: (orientation == Orientation.portrait) ? 3 / 4 : 4 / 3, // Adjust aspect ratio for orientation
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.pink[900],
            ),
          ),
        ],
      ),
    );
  }

  Widget bannerItem(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imageUrl,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
