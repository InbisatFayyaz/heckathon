import 'package:class_project/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD91106),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Image.network("https://clipart-library.com/img1/1275716.png",height: 150,),
        //  Image.network("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"),
          //  Image.asset('assets/splash_image.png', width: 200),
            SizedBox(height: 20),
            Text(
              'ZINDGI',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Center(
//         child: Text('This is the login screen.'),
//       ),
//     );
//   }
// }
