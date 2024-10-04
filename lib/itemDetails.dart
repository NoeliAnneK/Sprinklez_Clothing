import 'package:flutter/material.dart';
import 'package:mad_sprinklez_final/cart.dart';
import 'package:mad_sprinklez_final/order.dart';
import 'package:share_plus/share_plus.dart'; // Import the share_plus package

class ItemDetailsPage extends StatelessWidget {
  final String itemName;
  final String category;
  final double price;
  final String imageUrl;

  ItemDetailsPage({
    required this.itemName,
    required this.category,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double maxWidth = orientation == Orientation.landscape ? screenWidth * 0.6 : screenWidth;

    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[900]),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.pink[900]),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.share, color: Colors.pink[900]), // Add share icon
            onPressed: () {
              shareItem();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: maxWidth,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      imageUrl,
                      height: orientation == Orientation.portrait ? 300 : 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        itemName,
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait ? 28 : 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$$price',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait ? 24 : 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[800],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Quantity: in stock',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait ? 18 : 16,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Color',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    colorDot(Colors.brown[300]!),
                    SizedBox(width: 10),
                    colorDot(Colors.brown[500]!),
                    SizedBox(width: 10),
                    colorDot(Colors.brown[700]!),
                  ],
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Size (UK)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    sizeOption(context, '6'),
                    sizeOption(context, '8'),
                    sizeOption(context, '10'),
                    sizeOption(context, '12'),
                    sizeOption(context, '14'),
                    sizeOption(context, '16'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OrderDetailsPage(
                                itemName: itemName,
                                itemPrice: price.toString(),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Purchase Now',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ShoppingCartPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to share item details
  void shareItem() {
    Share.share(
      'Check out this $itemName from the $category category, priced at \$$price! Get it now from Sprinklez!',
      subject: 'Check out this item!',
    );
  }

  Widget colorDot(Color color) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget sizeOption(BuildContext context, String size) {
    return GestureDetector(
      onTap: () {
        // Handle size selection
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.pink[100],
          border: Border.all(color: Colors.black87),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
