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

