// import 'package:class_project/donors.dart';
// import 'package:class_project/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {

//  bool isLoading = false;

//   TextEditingController usernameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

  

  
//   registeruser()async{
//       try {
//   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email: emailController.text,
//     password: passwordController.text,
//   );
//    await credential.user!.sendEmailVerification();
//     print('Verification email sent');
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'weak-password') {
//     print('The password provided is too weak.');
//   } else if (e.code == 'email-already-in-use') {
//     print('The account already exists for that email.');
//   }
// } catch (e) {
//   print(e);
// }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//      padding: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 10),
//             decoration: BoxDecoration(
//               color: Color(0xffD91006),
//                borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(14),
//                bottomRight: Radius.circular(14),
//               )
//             ),

//              child: Column(
//               children: [
//                 Center(
//                 child: Image.network("https://clipart-library.com/img1/1275716.png",height: 150,),
//               ),  
//               SizedBox(height: 20),
//             Text(
//               'ZINDGI',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Container(
//               width: 300,padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                  borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: Offset(0, 3),
//                 ),
//               ]
//               ),
//                child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   'Sign Up',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 TextField(
//                   controller: usernameController,
//                 decoration: InputDecoration(
//                   labelText: 'Username',
//                 )
                  
//                 ),
//                 TextField(
//                   controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 )
                  
//                 ),
//                 TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                 ),
//                 obscureText: true,
//               ),
//           SizedBox(height: 16.0),
//               Stack(
//                 children: [
              
//               ElevatedButton(
//   onPressed: () async {
//      setState(() {
//           isLoading = true;
//         });
//     final username = usernameController.text;
//     final email = emailController.text;
//     final password = passwordController.text;

//     if (username.isEmpty || email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please fill in all fields.'),
//         ),
//       );
//     } else {
//       try {
//         final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );

//         await credential.user!.sendEmailVerification();
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verification email sent")));
//       //  print('Verification email sent');

//         // After successful registration, navigate to the home page
//         Navigator.push(context, MaterialPageRoute(builder: (context) => Donors()));
//       }
//        on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('The password provided is too weak.'),
//             ),
//           );
//         }
//          else if (e.code == 'email-already-in-use') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('The account already exists for that email.'),
//             ),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('An error occurred: ${e.message}'),
//             ),
//           );
//         }
        
//       }
//       finally {
//             // Set isLoading back to false when the process is complete
//             setState(() {
//               isLoading = false;
//             });
//           }
//     }
//   },
//   child: Text('Sign Up'),
// ),
//   if (isLoading)
//       Center(
//         child: CircularProgressIndicator(),
//       ),
              
//             ]
//           ),
//                   SizedBox(height: 20,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Already Have an Account?"),
//                 SizedBox(width: 5,),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())
//                     );
//                   },
//                   child: Text("Log In",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
//                 )
//               ],
//             )


//               ],
//             ),       
//     ),
//               ]
//     ),

//     ),
//     );
//   }
// }


import 'package:class_project/admin_page1.dart';
import 'package:class_project/donors.dart';
//import 'package:class_project/admin.dart'; // Import your AdminPage
import 'package:class_project/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String selectedRole = "Donor"; // Default to "Donor"

  bool isLoading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

 registeruser() async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    final userModel = UserModel(
      username: usernameController.text,
      email: emailController.text,
      role: selectedRole, // Store the selected role in the user model
    );

    await credential.user!.sendEmailVerification();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Verification email sent")));

    // Save the userModel to your database, such as Firebase Firestore
    // For example, if you're using Firebase Firestore, you can do:
    await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
      'username': userModel.username,
      'email': userModel.email,
      'role': userModel.role,
    });

    // After successful registration and data storage, navigate to the appropriate page
    if (userModel.role == "Admin") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => adminPage1()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Donors()));
    }
  } on FirebaseAuthException catch (e) {
    // Handle registration errors as before
  } finally {
    setState(() {
      isLoading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onChanged: (String? newValue) { // Modify the argument type to String?
            setState(() {
              selectedRole = newValue ?? "Donor"; // Use the null-aware operator to handle null
            });
          },
        ),


        // ... Rest of your SignupPage code ...

        Stack(
          children: [
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                final username = usernameController.text;
                final email = emailController.text;
                final password = passwordController.text;

                if (username.isEmpty || email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill in all fields.'),
                    ),
                  );
                } else {
                  registeruser();
                }
              },
              child: Text('Sign Up'),
            ),
            if (isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
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
        // ... Rest of your SignupPage code ...
      ),
    );
  }
}

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
