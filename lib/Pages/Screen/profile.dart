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
import 'package:wallets_app/Pages/Screen/widgets/c_widgets.dart';
import 'package:wallets_app/Pages/Screen/widgets/card_widgets.dart';

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
        backgroundColor: const Color(0xFFF4F8FB),
// This is AppBar
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 150,
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset('assets/wallet_logo.svg'),
            ),
          ),
//This is Notification Icon
          actions: [
            Container(
              padding: const EdgeInsets.only(
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
                      pageBuilder: (_, __, ___) => const NotificationPage(),
                      transitionDuration: const Duration(seconds: 0),
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
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 90,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    // spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                    ),
                    child: const Text(
                      'Zulfikar Ali Sumon',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                    ),
                    child: const Text(
                      'Customer ID',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: const Text(
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
                ),
                child: Column(
                  children: [
                    CardWidgets(
                      onTap: () {
                        print("offer");
                      },
                      icon: Icons.local_offer,
                      label: "Offer",
                    ),
// Add found.............
                    CardWidgets(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const AddFund(),
                            transitionDuration: const Duration(seconds: 0),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      icon: Icons.addchart_outlined,
                      label: "Add Fund",
                    ),
// Change pin..........
                    CardWidgets(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                const ChangePinScreen(),
                            transitionDuration: const Duration(seconds: 0),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      icon: Icons.change_circle_rounded,
                      label: "Change Pin",
                    ),
//Terms ans Conditions..........
                    CardWidgets(
                      onTap: () {},
                      icon: Icons.contact_support,
                      label: "Terms and Conditions",
                    ),
//Support...............
                    CwidgetsTwo(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const SupportScreen(),
                            transitionDuration: const Duration(seconds: 0),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      image: SvgPicture.asset("assets/support.svg"),
                      label: "Support",
                    ),
//! Sing Out.........
                    CwidgetsTwo(
                      onTap: () async {
                        var _token = await storage.read(key: "token");
                        print(_token);
                        var response = await http.post(
                            Uri.parse('http://54.226.160.184/user/logout/'),
                            headers: {
                              HttpHeaders.authorizationHeader: 'token $_token',
                            });
                        print(response.statusCode);

                        if (response.statusCode == 200) {
                          print('Logout done.');
                          await storage.delete(key: "token");
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => const LoginPage(),
                              ),
                              (route) => false);
                        } else {
                          print('error');
                        }
                      },
                      image: SvgPicture.asset("assets/singout.svg"),
                      label: "Signout",
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
