// import 'package:class_project/documentation.dart';
// import 'package:class_project/last_screen.dart';
// import 'package:flutter/material.dart';

// class MyForm extends StatelessWidget {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController dateController = TextEditingController();
//   final TextEditingController bloodGroupController = TextEditingController();

//    final Function(Donor) onDonorAdded;

//   MyForm({required this.onDonorAdded});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ADD NEW DONOR", style: TextStyle(color: Colors.white, fontSize: 22)),
//         backgroundColor: Colors.red,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Container(
//               child: TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//             ),
//             Container(
//               child: TextField(
//                 controller: cityController,
//                 decoration: InputDecoration(labelText: 'City'),
//               ),
//             ),
//             Container(
//               child: TextField(
//                 controller: phoneNumberController,
//                 decoration: InputDecoration(labelText: 'Phone Number'),
//               ),
//             ),
//             Container(
//               child: TextField(
//                 controller: dateController,
//                 decoration: InputDecoration(labelText: 'Date'),
//               ),
//             ),
//             Container(
//               child: TextField(
//                 controller: bloodGroupController,
//                 decoration: InputDecoration(labelText: 'Blood Group'),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 final name = nameController.text;
//                 final city = cityController.text;
//                 final phoneNumber = phoneNumberController.text;
//                 final date = dateController.text;
//                 final bloodGroup = bloodGroupController.text;


//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>DonorAddedScreen()));

//               },
//               child: Text('SUBMIT',style: TextStyle(fontSize: 22,color: Colors.white,backgroundColor: Colors.red),),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:class_project/documentation.dart';
import 'package:class_project/last_screen.dart';
import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  final Function(Donor) onDonorAdded;

  MyForm({required this.onDonorAdded});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD NEW DONOR", style: TextStyle(color: Colors.white, fontSize: 22)),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            Container(
              child: TextField(
                controller: cityController,
                decoration: InputDecoration(labelText: 'City'),
              ),
            ),
            Container(
              child: TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
            ),
            Container(
              child: TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Date'),
              ),
            ),
            Container(
              child: TextField(
                controller: bloodGroupController,
                decoration: InputDecoration(labelText: 'Blood Group'),
              ),
            ),
            
           Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Your text fields here

      SizedBox(height: 16), // Add some space between text fields and the button

      SizedBox(
  child: ElevatedButton(
    onPressed: () async {
      final name = nameController.text;
      final city = cityController.text;
      final phoneNumber = phoneNumberController.text;
      final date = dateController.text;
      final bloodGroup = bloodGroupController.text;

      bool confirm=await showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(title: Text("Confirm"),content: Text("Are you sure you want to add this donor?"),
        actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false); // No, do not add the donor
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true); // Yes, add the donor
              },
            ),
          ],
        );
      }
      );
      if(confirm==true){ Donor donor = Donor(name, city, date, bloodGroup); 
       addDonorData(donor);
      onDonorAdded(donor);}    
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DonorAddedScreen(
            name: nameController.text,
            city: cityController.text,
            date: dateController.text,
            bloodGroup: bloodGroupController.text,
          ),
        ),
      );
    },
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
    child: Text('SUBMIT', style: TextStyle(fontSize: 22, color: Colors.white)),
  ),
),
    ],
  ),
)

          ]
              ),
            ),
   
        );
  }
}

