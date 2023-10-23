// import 'package:cloud_firestore/cloud_firestore.dart';

// // void addDonorData() {
// //   FirebaseFirestore.instance.collection('donors').add({
// //     'Name': 'John Doe',
// //     'City': 'Lahore',
// //     'date':"22-10-23"
// //    // 'bloodType': 'A+',
// //     //'contactInfo': 'john.doe@example.com',
// //   },
// //   );
// // }


// void addDonorData() {
//   // Access Firestore collection reference
//   CollectionReference donorsCollection = FirebaseFirestore.instance.collection('donors');

//   // Add multiple donors
//   donorsCollection.add({
//     'name': 'Jhon Doe',
//     'City': 'Lahore',
//    'date':"22-10-23"
//     // 'bloodType': 'A+',
//     // 'contactInfo': 'donor1@example.com',
//   });

//   donorsCollection.add({
//       'Name': 'Ayan',
//      'City': 'Lahore',
//     'date':"2-9-22"
//   });

//    donorsCollection.add({
//       'Name': 'Ayan',
//      'City': 'Lahore',
//     'date':"2-9-22"
//   });

//    donorsCollection.add({
//       'Name': 'Hoorain',
//      'City': 'Islamabad',
//     'Date':"9-2-23"
//   });
//    donorsCollection.add({
//       'Name': '',
//      'City': 'Lahore',
//     'date':"2-9-22"
//   });
//   // Add more donors as needed
// }



import 'package:cloud_firestore/cloud_firestore.dart';

class Donor {
  String name;
  String city;
  String date;
  String bloodGroup;

  Donor(this.name, this.city, this.date, this.bloodGroup);

  //get bloodGroup => null;
}

void addDonorData(Donor donor) {
  CollectionReference donorsCollection = FirebaseFirestore.instance.collection('donors');

  donorsCollection.add({
    'Name': donor.name,
    'city': donor.city,
    'Date': donor.date,
    'Blood Group': donor.bloodGroup,
    
  });
}

