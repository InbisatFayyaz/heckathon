import 'package:flutter/material.dart';

class DonorDetail extends StatelessWidget {
  final String name;
  final String city;
  final String date;
  final String bloodGroup;

  DonorDetail({required this.name, required this.city, required this.date,required this.bloodGroup});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("DONOR DETAIL", style: TextStyle(color: Colors.white, fontSize: 22)),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: $name', style: TextStyle(fontSize: 24)),
            Text('City: $city', style: TextStyle(fontSize: 18)),
            Text('Date: $date', style: TextStyle(fontSize: 18)),
             Text('Blood Group: $bloodGroup', style: TextStyle(fontSize: 18)),

          ],
        ),
      ),
    );
  }
}
