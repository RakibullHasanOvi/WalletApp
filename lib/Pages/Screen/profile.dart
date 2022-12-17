import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallets_app/Pages/LoginPage.dart';
import 'package:wallets_app/Pages/Screen/addFund.dart';
import 'package:wallets_app/Pages/Screen/change_pin.dart';
import 'package:wallets_app/Pages/Screen/notifiations/notification.dart';
import 'package:wallets_app/Pages/Screen/support.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final storage = new FlutterSecureStorage();
    //
    final _height = MediaQuery.of(context).size.height;

    final _widht = MediaQuery.of(context).size.width;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Color(0xFFF4F8FB),

        // This is AppBar

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 150,
          leading: Container(
            margin: EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => WelcomePage()),
                // );
              },
              child: SvgPicture.asset('assets/wallet_logo.svg'),
            ),
          ),

          //This is Notification Icon

          actions: [
            Container(
              padding: EdgeInsets.only(
                right: 4,
              ),
              child: IconButton(
                iconSize: 10,
                icon: SvgPicture.asset(
                  'assets/notification_2.svg',
                  height: 22,
                ),
                onPressed: () {
                  // sending to notification page using (PageRouteBuilder)

                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => NotificationPage(),
                      transitionDuration: Duration(seconds: 0),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              height: 90,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    // spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
                // border: Border(
                //   bottom: BorderSide(
                //     width: 1.0,
                //     color: Colors.grey,
                //   ),
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 30,
                    ),
                    child: Text(
                      'RohimulKarimKhondokarForhad',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      left: 30,
                    ),
                    child: Text(
                      'Customer ID',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      '15994512',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: 18,
                  right: 18,
                  top: _height * 0.03,
                  bottom: _height * 0.03,
                ),
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F8FB),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      // spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  // border: Border(
                  //   bottom: BorderSide(
                  //     width: 1.0,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ),
                child: Column(
                  children: [
                    //
//Offer
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: ((context) {
                        //       return const ContactPage();
                        //     }),
                        //   ),
                        // );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                          left: 30,
                          right: 30,
                        ),
                        child: Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                // spreadRadius: 5,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Image.asset("assets/singout_logo.png"),
                                    Icon(
                                      Icons.local_offer,
                                      color: Color(0xFFD6001B),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Offer',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Add found.............
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const AddFund(),
                            transitionDuration: Duration(seconds: 0),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          // top: 30,
                          left: 30,
                          right: 30,
                        ),
                        child: Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                // spreadRadius: 5,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.addchart_outlined,
                                      color: Color(0xFFD6001B),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Add Fund',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Change pin..........

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                const ChangePinScreen(),
                            transitionDuration: Duration(seconds: 0),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          // top: 30,
                          left: 30,
                          right: 30,
                        ),
                        child: Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                // spreadRadius: 5,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.change_circle_rounded,
                                      color: Color(0xFFD6001B),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Chnage Pin',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //Terms ans Conditions..........

                    Padding(
                      padding: EdgeInsets.only(
                        // top: 30,
                        left: 30,
                        right: 30,
                      ),
                      child: Container(
                        height: 60,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              // spreadRadius: 5,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.contact_support_rounded,
                                    color: Color(0xFFD6001B),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Terms and Conditions',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //Support...............

                    Padding(
                      padding: EdgeInsets.only(
                        // top: 30,
                        left: 30,
                        right: 30,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const SupportScreen(),
                              transitionDuration: Duration(seconds: 0),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ),
                          );
                        },
                        child: Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                // spreadRadius: 5,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset("assets/support.svg"),
                                    //  Icon(
                                    //   Icons.support_agent_outlined,
                                    //   color: Color(0xFFD6001B),
                                    // ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Support',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

//! Sing Out.........

                    Padding(
                      padding: const EdgeInsets.only(
                        // top: 30,
                        left: 30,
                        right: 30,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          var _token = await storage.read(key: "token");
                          print(_token);
                          var response = await http.post(
                              Uri.parse('http://54.226.160.184/user/logout/'),
                              headers: {
                                HttpHeaders.authorizationHeader:
                                    'token ${_token}',
                              });
                          print(response.statusCode);

                          if (response.statusCode == 200) {
                            print('Logout done.');
                            await storage.delete(key: "token");
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => LoginPage(),
                                ),
                                (route) => false);
                          } else {
                            print('error');
                          }
                        },
                        // print('Logout done.');
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     PageRouteBuilder(
                        //       pageBuilder: (_, __, ___) => const LoginPage(),
                        //     ),
                        //     (route) => false);

                        child: Container(
                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                // spreadRadius: 5,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset("assets/singout.svg"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Signout',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*


*/