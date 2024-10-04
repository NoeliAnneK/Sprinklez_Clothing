// import 'package:geolocator/geolocator.dart';
//
// class Location {
//   late double latitude;
//   late double longitude;
//
//   Future<void> getCurrLocation() async {
//     try {
//       // Request permission for location access
//       LocationPermission permission;
//       permission = await Geolocator.requestPermission();
//
//       // Fetch the current position with high accuracy
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//
//       // Store latitude and longitude
//       latitude = position.latitude;
//       longitude = position.longitude;
//     } catch (e) {
//       // Print the error if any occurs
//       print(e);
//     }
//   }
// }
