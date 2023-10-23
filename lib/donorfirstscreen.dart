import 'package:class_project/donateblood.dart';
import 'package:flutter/material.dart';

class DonorDetailScreen extends StatelessWidget {
  final String name;
  final String city;
  final String lastDonationDate;
  final String bloodGroup;

  DonorDetailScreen({
    required this.name,
    required this.city,
    required this.lastDonationDate,
    required this.bloodGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donor Details", style: TextStyle(color: Colors.white, fontSize: 22)),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "City: $city",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "Last Donation Date: $lastDonationDate",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "Blood Group: $bloodGroup",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyDonate()));
                
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text("Donate Blood", style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
