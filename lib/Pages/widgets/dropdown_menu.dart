import 'package:flutter/material.dart';

//!List for  dropdown menu..
// List<String> list = [
//   "Personal",
//   "Agent",
// ];

class DropdownMenuWidget extends StatefulWidget {
  // List<DropdownMenuItem<String>>? items;
  DropdownMenuWidget({Key? key}) : super(key: key);

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 45,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF000000),
              ),
              menuMaxHeight: 150,
              borderRadius: BorderRadius.circular(15),
              dropdownColor: Colors.white,
              elevation: 0,
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
              ),
              items: [
                DropdownMenuItem<String>(
                  value: 'Personal',
                  child: Text('Personal'),
                ),
                DropdownMenuItem<String>(
                  value: 'Agent',
                  child: Text('Agent'),
                ),
              ],
              onChanged: (_value) {
                value = _value.toString();
                setState(
                  () {
                    value = _value.toString();
                  },
                );
              },
              hint: Container(
                child: const Text(
                  'Select',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                top: 5,
              ),
              child: Text(
                "$value",
                // textAlign: TextAlign.start,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DropdownButton<String>(
//               style: TextStyle(
//                 fontSize: 15,
//                 color: Color(0xFF000000),
//               ),
//               menuMaxHeight: 150,
//               borderRadius: BorderRadius.circular(15),
//               dropdownColor: Colors.white,
//               elevation: 0,
//               icon: Icon(
//                 Icons.keyboard_arrow_down_outlined,
//               ),
//               items: [
//                 DropdownMenuItem<String>(
//                   value: 'Personal',
//                   child: Text('Personal'),
//                 ),
//                 DropdownMenuItem<String>(
//                   value: 'Agent',
//                   child: Text('Agent'),
//                 ),
//               ],
//               onChanged: (_value) {
//                 setState(
//                   () {
//                     value = _value.toString();
//                   },
//                 );
//               },
//               hint: Container(
//                 child: Text(
//                   'Select',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF000000),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               alignment: Alignment.centerLeft,
//               margin: EdgeInsets.only(
//                 top: 5,
//               ),
//               child: Text(
//                 "$value",
//                 // textAlign: TextAlign.start,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 14,
//                   color: Color(0xFF000000),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );