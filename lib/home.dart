import 'package:flutter/material.dart';
import 'package:mad_sprinklez_final/CasualWear.dart';
import 'package:mad_sprinklez_final/profile.dart';
import 'package:mad_sprinklez_final/cart.dart';
import 'package:mad_sprinklez_final/myOrders.dart'; // Import the Orders page

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Track the active page

  // Fixing the list of pages to ensure it uses instances correctly
  final List<Widget> _pages = [
    HomePage(),       // Home Page
    MyOrdersPage(),   // Orders Page
    ShoppingCartPage(), // Shopping Cart
    Profile(),        // Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.pink[100], // Setting background color to the page
      body: SingleChildScrollView( // Landscape scrollable
        child: Center( // Center the content in landscape mode
          child: ConstrainedBox( // Add content width restriction
            constraints: BoxConstraints(
              maxWidth: screenWidth > 600 ? 600 : double.infinity, // Restrict width in landscape
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16), // Spacer from top
                  Text(
                    'Hello,\n      Sunny...',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 16), // Spacer
                  Stack(
                    children: [
                      Container( // Background container for banner
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Column(
                        children: [ // Banner Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'Assets/Images/Banner.png',
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container( // Container for sales information
                            width: double.infinity,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.pink[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Valentine Sale', // Banner text
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                  ),
                                ),
                                Text(
                                  '30% OFF', // Banner text (discount)
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16), // Spacer
                  // Using GridView to display items in a grid, responsive for landscape/portrait
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenWidth > 600 ? 3 : 2, // Adjust based on screen size
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.5, // Adjust to control image size
                    ),
                    itemCount: _categories.length, // Number of items in the grid
                    itemBuilder: (context, index) {
                      return categoryItem(
                        context,
                        _categories[index]['label']!,
                        _categories[index]['imageUrl']!,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
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

          // Navigate to the selected page using the updated index
          if (_currentIndex == 0) {
            Navigator.pushReplacement( // Ensure home page is not stacked
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (_currentIndex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyOrdersPage()), // Navigate to MyOrdersPage
            );
          } else if (_currentIndex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingCartPage()), // Navigate to Cart page
            );
          } else if (_currentIndex == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()), // Navigate to Profile page
            );
          }
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

  Widget categoryItem(BuildContext context, String label, String imageUrl) {
    return GestureDetector( // Detects gestures on category item
      onTap: () {
        if (label == 'Casual Wear') {
          Navigator.push( // Navigate to Casual Wear Page
            context,
            MaterialPageRoute(builder: (context) => CasualWearPage()), // Directing to Casual Wear page when clicked
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect( // Displaying the image of the category item
            borderRadius: BorderRadius.circular(10), // Round corners
            child: AspectRatio(
              aspectRatio: 0.7, // Adjust aspect ratio for a better fit
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8), // Spacer between image and label
          Text( // Label of the items
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, String>> _categories = [
  {'label': 'Work Wear', 'imageUrl': 'Assets/Images/work.jpg'},
  {'label': 'Casual Wear', 'imageUrl': 'Assets/Images/casual1.jpg'},
  {'label': 'Party Wear', 'imageUrl': 'Assets/Images/party.jpeg'},
  {'label': 'Tops', 'imageUrl': 'Assets/Images/tops.webp'},
  {'label': 'Jumpsuits', 'imageUrl': 'Assets/Images/jumpsuits.webp'},
];
