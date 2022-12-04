// import 'package:flutter/material.dart';
// import 'package:contacts_service/contacts_service.dart';

// class ContactPage extends StatefulWidget {
//   const ContactPage({super.key});

//   @override
//   State<ContactPage> createState() => _ContactPageState();
// }

// class _ContactPageState extends State<ContactPage> {
//   // Contect access in pjhone device
//   List<Contact> contacts = [];
//   List<Contact> contactsFiltered = [];
//   TextEditingController searchController = TextEditingController();
// // List<Contact>? _contacts;
// //
//   @override
//   void initState() {
//     super.initState();
//     getAllContacts();
//     searchController.addListener(() {
//       filterContacts();
//     });
//   }

//   getAllContacts() async {
//     // Get all contacts (lightly fetched)
//     List<Contact> _contacts = (await ContactsService.getContacts()).toList();
//     setState(() {
//       contacts = _contacts;
//     });
//     print(_contacts);

//     // Import contact from vCard
//   }

//   filterContacts() {
//     List<Contact> _contects = [];
//     _contects.addAll(contacts);
//     if (searchController.text.isNotEmpty) {
//       _contects.retainWhere((contact) {
//         String searchIerm = searchController.text.toLowerCase();
//         String contactName = contact.displayName.toString();
//         bool matchName = contactName.contains(searchIerm);
//         return contactName.contains(searchIerm);
//       });
//       setState(() {
//         contactsFiltered = _contects;
//       });
//       print(_contects);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isSearching = searchController.text.isEmpty;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contact Details'),
//       ),
//       body: GestureDetector(
//         onTap: () {
//           getAllContacts();
//           // filterContacts();
//         },
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(100.0),
//               child: Text(
//                 'Lest\s do this work ',
//                 // textAlign: TextAlign.start,
//               ),
//             ),
//             //Contact search bar..
//             Expanded(
//               child: Container(
//                   //   margin: EdgeInsets.symmetric(
//                   //     vertical: 15,
//                   //     horizontal: 50,
//                   //   ),
//                   //   // height: 40,
//                   //   child: TextFormField(
//                   //     controller: searchController,
//                   //     keyboardType: TextInputType.emailAddress,
//                   //     decoration: InputDecoration(
//                   //       contentPadding: EdgeInsets.symmetric(
//                   //         // vertical: 10,
//                   //         horizontal: 13,
//                   //       ),
//                   //       fillColor: Colors.black,
//                   //       border: OutlineInputBorder(
//                   //         borderRadius: BorderRadius.circular(8),
//                   //         borderSide: BorderSide.none,
//                   //       ),
//                   //       filled: true,
//                   //       // hintText: "$_numbers",

//                   //       hintText: 'search',
//                   //       hintStyle: TextStyle(
//                   //         color: Colors.white,
//                   //       ),
//                   //     ),
//                   //     validator: (value) {
//                   //       if (value!.isEmpty) {
//                   //         return 'Please enter some text';
//                   //       }
//                   //     },
//                   //   ),
//                   ),
//             ),
//             //Contact access..
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: isSearching == true
//                   ? contactsFiltered.length
//                   : contacts.length,
//               itemBuilder: (context, index) {
//                 Contact contact = isSearching == true
//                     ? contactsFiltered[index]
//                     : contacts[index];
//                 return ListTile(
//                   title: Text(
//                     contact.displayName.toString(),
//                   ),
//                   subtitle: Text(
//                     contact.phones!.elementAt(0).value.toString(),
//                   ),
//                   leading:
//                       (contact.avatar != null && contact.avatar!.length > 0)
//                           ? CircleAvatar(
//                               backgroundImage: MemoryImage(
//                                 contact.avatar!,
//                               ),
//                             )
//                           : CircleAvatar(
//                               child: Text(
//                                 contact.initials(),
//                                 style: TextStyle(
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                             ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
