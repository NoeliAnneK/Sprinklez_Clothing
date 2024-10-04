import 'package:flutter/material.dart';
import 'package:mad_sprinklez_final/CasualWear.dart';
import 'package:mad_sprinklez_final/profile.dart';
import 'package:mad_sprinklez_final/cart.dart';
import 'package:mad_sprinklez_final/myOrders.dart'; // Import the Orders page
import 'package:mad_sprinklez_final/home.dart'; // Import your Home page

class OrderDetailsPage extends StatefulWidget {
  final String itemName;
  final String itemPrice;

  OrderDetailsPage({
    required this.itemName,
    required this.itemPrice,
  });

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedProvince;
  String? _selectedDistrict;
  bool _isCashOnDelivery = false;
  bool _isOnlinePayment = false;
  int _selectedLabel = 0;
  int _currentIndex = 0; // Track the active page

  final List<String> _provinces = [
    'Central Province',
    'Eastern Province',
    'North Central Province',
    'Southern Province',
    'Western Province'
  ];
  final Map<String, List<String>> _districts = {
    'Central Province': ['Kandy', 'Matale'],
    'Eastern Province': ['Batticaloa', 'Ampara'],
    'North Central Province': ['Anuradhapura', 'Polonnaruwa'],
    'Southern Province': ['Galle', 'Hambantota'],
    'Western Province': ['Colombo', 'Gampaha'],
  };

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details', style: TextStyle(color: Colors.black87)), // Set text color
        backgroundColor: Colors.pink[200],
      ),
      body: Container(
        color: Colors.pink[100], // Set fixed background color
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isLandscape ? width * 0.5 : width * 0.8, // Centering the box in landscape mode
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Item: ${widget.itemName}',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87), // Set text color
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Price: ${widget.itemPrice}',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87), // Set text color
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: TextStyle(color: Colors.black87),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                labelText: 'Address',
                                labelStyle: TextStyle(color: Colors.black87),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your address';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                labelText: 'Contact Number',
                                labelStyle: TextStyle(color: Colors.black87),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your contact number';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 5),
                            DropdownButtonFormField<String>(
                              value: _selectedProvince,
                              hint: Text('Select Province', style: TextStyle(color: Colors.black87)),
                              items: _provinces.map((province) {
                                return DropdownMenuItem<String>(
                                  value: province,
                                  child: Text(province, style: TextStyle(color: Colors.black87)), // Set text color
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedProvince = value;
                                  _selectedDistrict = null; // Reset district selection
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                              ),
                              style: TextStyle(color: Colors.black87),
                              dropdownColor: Colors.pink[100], // Set fixed dropdown color
                            ),
                            SizedBox(height: 5),
                            DropdownButtonFormField<String>(
                              value: _selectedDistrict,
                              hint: Text('Select District', style: TextStyle(color: Colors.black87)),
                              items: (_selectedProvince != null
                                  ? _districts[_selectedProvince]!
                                  : [])
                                  .map((district) {
                                return DropdownMenuItem<String>(
                                  value: district,
                                  child: Text(district, style: TextStyle(color: Colors.black87)), // Set text color
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedDistrict = value;
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                              ),
                              style: TextStyle(color: Colors.black87),
                              dropdownColor: Colors.pink[100], // Set fixed dropdown color
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Checkbox(
                                  value: _isCashOnDelivery,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isCashOnDelivery = value ?? false;
                                      if (_isCashOnDelivery) {
                                        _isOnlinePayment = false;
                                      }
                                    });
                                  },
                                ),
                                Text('Cash on Delivery', style: TextStyle(color: Colors.black87)), // Set text color
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: _isOnlinePayment,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isOnlinePayment = value ?? false;
                                      if (_isOnlinePayment) {
                                        _isCashOnDelivery = false;
                                      }
                                    });
                                  },
                                ),
                                Text('Online Payment', style: TextStyle(color: Colors.black87)), // Set text color
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Select a label for effective delivery:',
                              style: TextStyle(fontSize: 16, color: Colors.black87), // Set text color
                            ),
                            SizedBox(height: 5),
                            ToggleButtons(
                              isSelected: [_selectedLabel == 0, _selectedLabel == 1],
                              onPressed: (int index) {
                                setState(() {
                                  _selectedLabel = index;
                                });
                              },
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  child: Text('Home', style: TextStyle(color: Colors.black87)), // Set text color
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  child: Text('Office', style: TextStyle(color: Colors.black87)), // Set text color
                                ),
                              ],
                              color: Colors.black87,
                              selectedColor: Colors.white,
                              fillColor: Colors.pinkAccent,
                              borderColor: Colors.pinkAccent,
                              selectedBorderColor: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    // Process order
                                    Navigator.pop(context); // Navigate back
                                  }
                                },
                                child: Text('Submit Order'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pinkAccent, // Set button color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'My Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        //currentIndex: _currentIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.white, // Optional: Set the unselected item color
        backgroundColor: Colors.pink[100], // Set background color for the nav bar
        onTap: (index) {
          setState(() {
            //_currentIndex = 2;
            switch (index) {
              case 0:
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())); // Navigate to Home
                break;
              case 1:
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShoppingCartPage())); // Navigate to Cart
                break;
              case 2:
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyOrdersPage())); // Navigate to My Orders
                break;
              case 3:
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile())); // Navigate to Profile
                break;
            }
          });
        },
      ),
    );
  }
}
