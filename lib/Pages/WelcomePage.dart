import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallets_app/Pages/LoginPage.dart';

import 'Screen/buttom_navigation.dart';
import 'Screen/otp_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  //
  //
  //
  //
  double _pinYoffset = 0;
  double _pinOpacity = 1;
  int _pageState = 0;
  var _backGroundColor = Color(0xFFD6001B);
  double height = 0;
  double width = 0;
  bool _obscureText = true;
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    switch (_pageState) {
      case 0:
        _pinYoffset = height;
        ;
        _pinOpacity = 1;
        _backGroundColor = _backGroundColor;
        break;

      case 1:
        _backGroundColor = _backGroundColor;
        _pinYoffset = 380;
        _pinOpacity = 0.7;
        break;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: _backGroundColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 170,
                      bottom: 170,
                    ),
                    child: SvgPicture.asset(
                      'images/Wallet_logo.svg',
                      // width: 200,
                      height: 50,
                    ),
                    // child: Image.asset(
                    //   'assets/Group 255.png',
                    //   color: Colors.white,
                    //   // height: 40,
                    //   // width: 1100,
                    // ),
                    // child: const Image(
                    //   image: const AssetImage('assets/Group 255.png'),
                    //   color: Colors.white,
                    // ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 10,
                  ),
                  Container(
                    child: const Text(
                      'enjoy the worlds fastest and network',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width / 1.2, height / 14),
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        // _pageState = 1;
                        if (_pageState != 0) {
                          _pageState = 0;
                        } else {
                          _pageState = 1;
                        }
                      });
                      // Navigator.push(
                      //   context,
                      //   PageRouteBuilder(
                      //     pageBuilder: (_, __, ___) => const LoginPage(),
                      //     transitionDuration: Duration(seconds: 0),
                      //     transitionsBuilder: (_, a, __, c) =>
                      //         FadeTransition(opacity: a, child: c),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD6001B),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // Text(
                  //   'LOGIN',
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     color: Color.fromARGB(255, 237, 29, 14),
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Language',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          // margin: EdgeInsets.only(),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white10),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  side: const BorderSide(
                                    color: Colors.white10,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'English',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(
                  () {
                    _pageState = 0;
                    // if (_pageState != 1) {
                    //   _pageState = 1;
                    // } else {
                    //   _pageState = 0;
                    // }
                    // print('Click MotherF**ker');
                  },
                );
              },
              child: AnimatedContainer(
                curve: Curves.decelerate,
                duration: Duration(
                  milliseconds: 1000,
                ),
                transform: Matrix4.translationValues(0, _pinYoffset, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: LoginPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
