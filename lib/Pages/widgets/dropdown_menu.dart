import 'package:flutter/material.dart';

class DropdownMenuWidget extends StatefulWidget {
  const DropdownMenuWidget({Key? key}) : super(key: key);

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.centerLeft,
      // height: 40,
      // width: 150,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(15),
      //   color: Color(0xFFFFFFFF),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF000000),
              ),
              menuMaxHeight: 150,
              borderRadius: BorderRadius.circular(15),
              dropdownColor: Colors.white,
              elevation: 0,
              icon: Icon(
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
                setState(
                  () {
                    value = _value.toString();
                  },
                );
              },
              hint: Container(
                // alignment: Alignment.centerLeft,
                // height: MediaQuery.of(context).size.width * 1,
                // width: MediaQuery.of(context).size.height * .2,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   color: Colors.white,
                // ),
                // height: 90,
                // width: 150,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(15),
                //   color: Colors.white,
                // ),
                child: Text(
                  'Select',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                top: 5,
              ),
              child: Text(
                "$value",
                // textAlign: TextAlign.start,
                style: TextStyle(
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
