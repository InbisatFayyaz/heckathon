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
     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("please fill all required fields.",style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xffD91006),
        duration: Duration(seconds: 3),
        )
        ); 
     }
    try {
      print("login attempt");
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print("Credential: $credential");
      if (credential.user != null) {
        if (selectedRole == "Admin") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => adminPage1()));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DonorDetailScreen(name: "Inbisat", city: "Karachi", lastDonationDate: "01-01-23", bloodGroup: "B+")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Authentication Failed.Please check yur email and password",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        )
        );
      }
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found for this email",style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password provided for this email.",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        )
        );
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
             onChanged: (String? newValue) { 
             setState(() {
                selectedRole = newValue ?? "Donor"; 
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
