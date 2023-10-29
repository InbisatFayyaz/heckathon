import 'package:class_project/admin_page1.dart';
import 'package:class_project/donorfirstscreen.dart';
import 'package:class_project/donors.dart';
//import 'package:class_project/admin.dart'; // Import your AdminPage
import 'package:class_project/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UserModel {
  final String username;
  final String email;
  final String role;

  UserModel({
    required this.username,
    required this.email,
    required this.role,
  });
}


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String selectedRole = "Donor"; 

  bool isLoading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

 registeruser() async {
  if (usernameController.text.isEmpty||emailController.text.isEmpty||passwordController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please fill or required fields.",style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.red,));
  }
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    final userModel = UserModel(
      username: usernameController.text,
      email: emailController.text,
      role: selectedRole, 
    );

    await credential.user!.sendEmailVerification();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verification email sent")));

    
    await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
      'username': userModel.username,
      'email': userModel.email,
      'role': userModel.role,
    });

     if (credential.user != null) {
    if (userModel.role == "Admin") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => adminPage1()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => 
      DonorDetailScreen(name: "Inbisat", city: "Karachi", lastDonationDate: "01-01-23", bloodGroup: "B+")));   
    }
    
  }else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Authentication failed. Please check your Email and Password",style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.red,)
    );
  }
  }
  on FirebaseAuthException catch (e) {
    
  } finally {
    setState(() {
      isLoading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child:
      Container(
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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                )
                  
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
          SizedBox(height: 16.0),


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
            }
            );
          }
        ),


        Stack(
          children: [
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xffD91006)));
                });
                final username = usernameController.text;
                final email = emailController.text;
                final password = passwordController.text;

                if (username.isEmpty || email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill in all fields.',style: TextStyle(color: Colors.white),),
                      backgroundColor: Color(0xffD91006),
                    ),
                  );
                } else {
                  registeruser();
                }
                if(isLoading)
                Center(child: CircularProgressIndicator(),
                );
              },
              child: Text('Sign Up'),
            ),
            // if (isLoading)
            //   Center(
            //     child: CircularProgressIndicator(),
            //   ),
          ],
        ),
 SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have an Account?"),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())
                    );
                  },
                  child: Text("Log In",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                )
              ],
            )


              ],
            ),       
    ),
              ]
    ),
        
      ),
      ),
    );
  }
}


