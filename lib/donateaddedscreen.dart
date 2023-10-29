
import 'package:class_project/login.dart';
import 'package:flutter/material.dart';

class blooddonatescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donor Added", style: TextStyle(color: Colors.white, fontSize: 22)),
        backgroundColor: Colors.red, 
        actions: [
          IconButton(
            icon: Icon(Icons.logout), 
            onPressed: () {
             Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
      ),
      body: Container(color: Colors.white,
        child: Center(
          child: Text(
            "BLOOD DONATED \N THANK YOU!", 
            style: TextStyle(fontSize: 26,color: Colors.red),
          ),
        ),
      ),
    );
  }
}
