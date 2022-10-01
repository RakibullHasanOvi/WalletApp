import 'package:flutter/material.dart';
import 'package:wallets_app/models/MobileBanking.dart';

import '../WelcomePage.dart';

class NotificationPage extends StatelessWidget {
  // const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          leadingWidth: 200,
          leading: Container(
            margin: EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ),
                );
              },
              child: Image.asset('assets/Group 255.png'),
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(
                right: 18,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Group 38.png',
                  height: 22,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 30,
                        left: 20,
                      ),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 60,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    child: Text(
                      'NOTIFICATON',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      "assets/bKash_logo.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Flexible(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // alignment: Alignment.centerLeft,
                          child: Text(
                            'MOBILE BANKING',
                            style: TextStyle(
                              fontSize: 10,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        Text(
                          '01919972700',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            // letterSpacing: 3,
                          ),
                        ),
                        Text(
                          '02- MONDAY',
                          style: TextStyle(
                            fontSize: 12,
                            // letterSpacing: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Pending',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      // letterSpacing: 3,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "5000.00 BDT",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 3,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      "assets/Nagad_logo.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // alignment: Alignment.centerLeft,
                          child: Text(
                            'MOBILE BANKING',
                            style: TextStyle(
                              fontSize: 10,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        Text(
                          '01717256199',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            // letterSpacing: 3,
                          ),
                        ),
                        Text(
                          '02- MONDAY',
                          style: TextStyle(
                            fontSize: 12,
                            // letterSpacing: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Completed',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      // letterSpacing: 3,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "20,000.00 BDT",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      // letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
