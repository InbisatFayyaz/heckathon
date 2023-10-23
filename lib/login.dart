/*import 'package:class_project/donors.dart';
import 'package:class_project/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  loginuser()async{
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
  );
   if (credential.user != null) {
      // User is authenticated, proceed to the home page
      Navigator.push(context, MaterialPageRoute(builder: (context) => Donors()));
    } else {
      print('Authentication failed. Please check your email and password.');
    }
  
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   backgroundColor: Color(0xffD91006),
    body: Container(
     padding: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 10),
            decoration: BoxDecoration(
              color: Color(0xffD91006),
               borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14),
               bottomRight: Radius.circular(14),
              )
            ),

             child: Column(
              children: [
                Center(
                child: Image.network("https://clipart-library.com/img1/1275716.png",height: 150,),
              ),  
              SizedBox(height: 20),
            Text(
              'ZINDGI',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 300,padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ]
              ),
               child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                )
                  
                ),
                TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 16,),
              ElevatedButton(onPressed: () async{
                 final email = emailController.text;
                 final password = passwordController.text;
                 if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill required fields")));
      // Show an error message or prevent navigation if fields are empty
      print("Email and password are required.");
    } else {
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (credential.user != null) {
          // User is authenticated, proceed to the home page
          Navigator.push(context, MaterialPageRoute(builder: (context) => Donors()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Authentication failed. Please check your email and password.")));
          // Authentication failed, display an error message
       //   print('Authentication failed. Please check your email and password.');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No User found for this Email.")));
         // print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Password provided for that user.")));
     //     print('Wrong password provided for that user.');
        }
      }
    }
  },
  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red),),
    child: Text("Login")
    ),
      SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have an Account?"),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage())
                    );
                  },
                  child: Text("Sign Up",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                )
              ],
            )
                
              ],
            ),       
    ),
              ]
    )
    )
    );
  }
}*/


import 'package:class_project/admin_page1.dart';
import 'package:class_project/donorfirstscreen.dart';
import 'package:class_project/donors.dart';
import 'package:class_project/signup.dart';
import 'package:class_project/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String selectedRole = "Donor"; 

  loginAsUser() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (credential.user != null) {
        if (selectedRole == "Admin") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => adminPage1()));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DonorDetailScreen(name: "Inbisat", city: "Karachi", lastDonationDate: "01-01-23", bloodGroup: "B+")));
        }
      } else {
        print('Authentication failed. Please check your email and password.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child:
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xffD91006),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
        ),
        child:
         Column(
          children: [
            Center(
              child: Image.network(
                "https://clipart-library.com/img1/1275716.png",
                height: 150,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'ZINDGI',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                 DropdownButton<String>(
  value: selectedRole,
  items: ["Donor", "Admin"].map((role) {
    return DropdownMenuItem<String>(
      value: role,
      child: Text(role),
    );
  }).toList(),
  onChanged: (String? newValue) { // Change the argument type to String?
    setState(() {
      selectedRole = newValue ?? "Donor"; // Use the null-aware operator to handle null
    });
  },
),

                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      loginAsUser();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: Text("Login"),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have an Account?"),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignupPage()),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      )
    );
  }
}
