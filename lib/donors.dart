// import 'package:class_project/details.dart';
// import 'package:class_project/documentation.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';


// class Donors extends StatefulWidget {
//   const Donors({Key? key});

//   @override
//   State<Donors> createState() => _DonorsState();
// }

// class _DonorsState extends State<Donors> {
//     List<Donor> donorList = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ALL DONORS", style: TextStyle(color: Colors.white, fontSize: 22)),
//         backgroundColor: Colors.red,
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('donors').snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           var donors = snapshot.data?.docs;

//           if (donors == null || donors.isEmpty) {
//             return Text('No donors available.');
//           }

//           List<Donor> donorList = donors.map((donor) {
//             var data = donor.data() as Map<String, dynamic>;
//             return Donor(
//               data['Name'] ?? '',
//               data['city'] ?? '',
//               data['Date'] ?? '',
//               data['Blood Group'] ?? '',
//             );
//           }
//           ).toList();
//               return Container(
//   child: ListView(
//     children: donorList.map((donor) {
//       return Container(
//         padding: EdgeInsets.all(10),
//         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 3),
//             ),
//           ],
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: ListTile(
//           title: Text(donor.name),
//           subtitle: Text(donor.city),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DonorDetail(
//                   name: donor.name,
//                   city: donor.city,
//                   date: donor.date,
//                   bloodGroup: donor.bloodGroup,
//                 ),
//               ),
//             );
//           },
//         ),
//       );
//     }).toList(),
//   ),
// );

        
//         },
//       ),
//     );
//   }
// }


import 'package:class_project/details.dart';
import 'package:class_project/documentation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Donors extends StatefulWidget {
  const Donors({Key? key}) : super(key: key);

  @override
  _DonorsState createState() => _DonorsState();
}

class _DonorsState extends State<Donors> {
  List<Donor> donorList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ALL DONORS", style: TextStyle(color: Colors.white, fontSize: 22)),
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('donors').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          var donors = snapshot.data?.docs;

          if (donors == null || donors.isEmpty) {
            return Text('No donors available.');
          }

          // Create the list of donors
          donorList = donors.map((donor) {
            var data = donor.data() as Map<String, dynamic>;
            return Donor(
              data['Name'] ?? '',
              data['city'] ?? '',
              data['Date'] ?? '',
              data['Blood Group'] ?? '',
            );
          }).toList();

          return Container(
            child: ListView(
              children: donorList.map((donor) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(donor.name),
                    subtitle: Text(donor.city),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DonorDetail(
                            name: donor.name,
                            city: donor.city,
                            date: donor.date,
                            bloodGroup: donor.bloodGroup,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  void addDonor(Donor donor) {
    // Update the list of donors
    setState(() {
      donorList.add(donor);
    });
  }
}

