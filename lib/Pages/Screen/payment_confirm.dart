import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallets_app/Pages/Screen/buttom_navigation.dart';
import 'package:wallets_app/Pages/Screen/notifiations/notification.dart';
import 'package:wallets_app/models/services/all_get_api.dart';

class PaymentConfirm extends StatelessWidget {
  const PaymentConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F8FB),
        appBar: AppBar(
          elevation: 0.3,
          backgroundColor: Colors.white,
          leadingWidth: 200,
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/wallet_logo.svg",
                // color: Colors.red,
              ),
              // child: Image.asset('assets/Group 255.png'),
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(
                right: 4,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const NotificationPage();
                      },
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'images/Notification.svg',
                  height: 22,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              // color: Colors.white.withOpacity(0.8),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/tk.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            FutureBuilder<int>(
                              future: getBalance(
                                  "http://zune360.com/api/user/current_balance/"),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    '\৳ ' + snapshot.data.toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                                return const Text('');
                              },
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
                  ],
                ),
              ),
            ),
            //
            //
//1st container use white color and also using opacity....
            Container(
              color: Colors.white.withOpacity(0.8),
            ),
//2nd container use Red color and text , icon , button etc..
            Container(
              // color: Colors.white.withOpacity(0.8),
              height: height.h,
              width: width,
              transform: Matrix4.translationValues(0, height * 0.2.h, 0),
              decoration: const BoxDecoration(
                color: Color(0xFFD6001B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 100.h,
                    ),
                    child: Image.asset(
                      'assets/Right_logo.png',
                      height: 80.h,
                      width: 80.w,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Successful!",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text(
                    'Click the button bellow to continue',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => BottomNavigation(),
                          transitionDuration: Duration(seconds: 0),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width / 1.3, 50),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Flexible(
//                       child: Container(
//                         margin: EdgeInsets.only(
//                           top: 50,
//                         ),
//                         height: MediaQuery.of(context).size.height,
//                         width: MediaQuery.of(context).size.width,
//                         // color: Colors.red[700],
//                         decoration: BoxDecoration(
//                           color: Color(0xFFD6001B),
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(50),
//                             topRight: Radius.circular(50),
//                           ),
//                         ),
//                         child: Column(
//                           // mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(
//                                 top: 100,
//                               ),
//                               child: Image.asset(
//                                 'assets/Right_logo.png',
//                                 height: 80,
//                                 width: 80,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Container(
//                               child: Text(
//                                 'Payment',
//                                 style: TextStyle(
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(),
//                             Container(
//                               child: Text(
//                                 "Successful!",
//                                 style: TextStyle(
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               child: Text(
//                                 'Click the button bellow to continue',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 200,
//                             ),
//                             Container(
//                               // margin: EdgeInsets.only(
//                               //   top: 0,
//                               // ),
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     PageRouteBuilder(
//                                       pageBuilder: (_, __, ___) =>
//                                           BottomNavigation(),
//                                       transitionDuration: Duration(seconds: 0),
//                                       transitionsBuilder: (_, a, __, c) =>
//                                           FadeTransition(opacity: a, child: c),
//                                     ),
//                                   );
//                                 },
//                                 child: Text(
//                                   'Continue',
//                                   style: TextStyle(
//                                     fontSize: 19,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                   minimumSize: Size(300, 50),
//                                   primary: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),