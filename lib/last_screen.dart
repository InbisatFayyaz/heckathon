import 'package:class_project/login.dart';
import 'package:flutter/material.dart';

// class DonorAddedScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Donor Added", style: TextStyle(color: Colors.white, fontSize: 22)),
//         backgroundColor: Colors.red, 
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout), 
//             onPressed: () {
//              Navigator.of(context).popUntil((route) => route.isFirst);
//             },
//           ),
//         ],
//       ),
//       body: Container(color: Colors.white,
//         child: Center(
//           child: Text(
//             "DONOR ADDED", 
//             style: TextStyle(fontSize: 26,color: Colors.red),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class DonorAddedScreen extends StatelessWidget {
  final String name;
  final String city;
  final String date;
  final String bloodGroup;

  DonorAddedScreen({
    required this.name,
    required this.city,
    required this.date,
    required this.bloodGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Donor Added",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Handle logout or navigate to the login screen.
              // You can use Navigator to navigate to the login screen.
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Donor Added",
              style: TextStyle(fontSize: 20),
            ),
            // Display the donor's information
            Text('Name: $name'),
            Text('City: $city'),
            Text('Date: $date'),
            Text('Blood Group: $bloodGroup'),
          ],
        ),
      ),
    );
  }
}
