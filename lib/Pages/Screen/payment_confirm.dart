import 'package:flutter/material.dart';
import 'package:wallets_app/Pages/Screen/notification.dart';
import 'package:wallets_app/Pages/WelcomePage.dart';

class PaymentConfirm extends StatefulWidget {
  const PaymentConfirm({Key? key}) : super(key: key);

  @override
  State<PaymentConfirm> createState() => _PaymentConfirmState();
}

class _PaymentConfirmState extends State<PaymentConfirm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        // backgroundColor: Colors.blue[50].withOpacity(col),
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
          // title: Container(
          //   alignment: Alignment.centerLeft,
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => WelcomePage()),
          //       );
          //     },
          //     child: Image.asset('assets/Group 255.png'),
          //   ),
          // ),
          actions: [
            Container(
              padding: EdgeInsets.only(
                right: 18,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NotificationPage();
                      },
                    ),
                  );
                },
                icon: Image.asset(
                  'assets/Group 38.png',
                  height: 22,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/tk.png'),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          '10,00,000 BDT',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Current balance',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 50,
                    ),
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.red[700],
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 237, 29, 14),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 100,
                          ),
                          child: Image.asset(
                            'assets/Right_logo.png',
                            height: 80,
                            width: 80,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                            'Payment',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(),
                        Container(
                          child: Text(
                            "Successful!",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            'Click the button bellow to continue',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 200,
                        ),
                        Container(
                          // margin: EdgeInsets.only(
                          //   top: 0,
                          // ),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(300, 50),
                              primary: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
