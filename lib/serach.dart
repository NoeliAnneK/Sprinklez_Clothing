// import 'package:flutter/material.dart';
// import 'package:mad_sprinklez_final/CasualWear.dart';
// import 'package:mad_sprinklez_final/home.dart';
// import 'package:mad_sprinklez_final/profile.dart';
// import 'package:mad_sprinklez_final/serach.dart';
// import 'package:mad_sprinklez_final/cart.dart';
//
// class searchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<searchPage> {
//   int _currentIndex = 1; // Default to the SearchPage
//   final List<Widget> _pages = [
//     HomePage(),
//     searchPage(),
//     ShoppingCartPage(),
//     Profile(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pink[100], // setting the background colour
//       appBar: AppBar(
//         title: TextField(
//           decoration: InputDecoration(
//             hintText: 'Casual Wear', // placeholder text in the search field
//             border: InputBorder.none, // no border for input field
//           ),
//         ),
//         backgroundColor: Colors.pink[200], // adding darker color to app bar
//         elevation: 0,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0), // padding around the text
//             child: Text(
//               'Sunny,',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue[900],
//               ),
//             ),
//           ),
//           SizedBox(height: 10), // space between elements
//           TextField(
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white, // adding white as the background color of the input field
//               hintText: 'What is your outfit Today?', // adding placeholder text
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30), // rounded corners
//               ),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.access_time), // recent icon
//             title: Text('Sleeveless tops'), // title of the recent list
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Top Categories',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue[900],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView( // scrollable list of items
//               children: [
//                 ListTile(
//                   title: Text('Casual Wear'),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => CasualWearPage()), // Navigate to CasualWearPage
//                     );
//                   },
//                 ),
//                 ListTile(
//                   title: Text('Party Wear'),
//                 ),
//                 ListTile(
//                   title: Text('Work Wear'),
//                 ),
//                 ListTile(
//                   title: Text('Tops'),
//                 ),
//                 ListTile(
//                   title: Text('Jumpsuits'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar( // navigation bar
//         currentIndex: _currentIndex, // Set the current selected index
//         selectedItemColor: Colors.pinkAccent,
//         unselectedItemColor: Colors.white,
//         backgroundColor: Colors.pink[100],
//         type: BottomNavigationBarType.fixed,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index; // Update current index
//           });
//           Navigator.push( // Navigate based on selected index
//             context,
//             MaterialPageRoute(builder: (context) => _pages[index]),
//           );
//         },
//         items: [
//           BottomNavigationBarItem( // adding icons to the bottom nav bar
//             icon: Icon(Icons.home),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }
// }
