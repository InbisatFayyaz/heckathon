// import 'package:flutter/material.dart';

// class adminPage1 extends StatelessWidget {
//   const adminPage1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("BLOOD DONATION MAP", style: TextStyle(color: Colors.white, fontSize: 22)),
//         backgroundColor: Colors.red,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Image.network("https://www.google.com/maps/d/thumbnail?mid=1GEFB0zNSNM46eQlsmWPLx-JIwm4&hl=en_US"),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: Text(
//                     "O+",
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: Text(
//                     "A+",
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: Text(
//                     "B+",
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//                  SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: Text(
//                     "AB+",
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//                  SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: Text(
//                     "O-",
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//                  SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: Text(
//                     "A-",
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//                  SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: Text(
//                     "B-",
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//                  SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: Text(
//                     "AB-",
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//     SizedBox(height: 20), // Vertical spacing between buttons and new buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: Text(
//                     "SHOW MORE",
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),SizedBox(width: 10), // Space between buttons
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: Text(
//                     "ADD NEW DONOR",
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
                
//                 // Add more buttons in the same way
//               ],
//             ),
//             // Add more rows of buttons or additional widgets as needed
//           ],
//         ),
//           ]
//       ),
//       )
//     );
//   }
// }

import 'package:class_project/addnew.dart';
import 'package:class_project/donors.dart';
import 'package:flutter/material.dart';

class adminPage1 extends StatelessWidget {
  const adminPage1({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLOOD DONATION MAP", style: TextStyle(color: Colors.white, fontSize: 22)),
        backgroundColor: Colors.red,
      ),
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
            Image.network("https://www.google.com/maps/d/thumbnail?mid=1GEFB0zNSNM46eQlsmWPLx-JIwm4&hl=en_US"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "O+",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "A+",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "B+",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "AB+",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "O-",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "A-",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "B-",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "AB-",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Donors()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "SHOW MORE",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyForm()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    "ADD NEW DONOR",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

