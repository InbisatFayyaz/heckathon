import 'package:class_project/donateaddedscreen.dart';
import 'package:class_project/last_screen.dart';
import 'package:flutter/material.dart';

class MyDonate extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DONATE BLOOD", style: TextStyle(color: Colors.white, fontSize: 22)),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Container(
            //   child: TextField(
            //     controller: nameController,
            //     decoration: InputDecoration(labelText: 'Name'),
            //   ),
            // ),
            // Container(
            //   child: TextField(
            //     controller: cityController,
            //     decoration: InputDecoration(labelText: 'City'),
            //   ),
            // ),
            Container(
              child: TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
            ),
            Container(
              child: TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Date'),
              ),
            ),
            Container(
              child: TextField(
                controller: bloodGroupController,
                decoration: InputDecoration(labelText: 'How many Bottles You Donate?'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
               // final name = nameController.text;
               // final city = cityController.text;
                final phoneNumber = phoneNumberController.text;
                final date = dateController.text;
                final bloodGroup = bloodGroupController.text;

                Navigator.push(context, MaterialPageRoute(builder: (context)=>blooddonatescreen()));

                // Now you can use these values as needed, for example, save them to Firebase.
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Background color
                onPrimary: Colors.red, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('SUBMIT', style: TextStyle(fontSize: 22)),
            ),
          ],
        ),
      ),
    );
  }
}
