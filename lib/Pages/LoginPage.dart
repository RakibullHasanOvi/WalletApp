import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallets_app/Pages/HomePage.dart';

import 'Screen/buttom_navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: ListView(
        children: [
          Container(
            height: height / 2,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 40,
                    left: 25,
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFFD6001B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 28,
                  ),
                  child: Text(
                    'Lets get started',
                    style: TextStyle(
                      color: Color(0xFF999999),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    right: 28,
                    left: 28,
                  ),
                  child: Form(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFF4F8FB),
                        hintText: 'Mobile number',
                        hintStyle: TextStyle(
                          color: Color(0xFF999999),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    right: 28,
                    left: 28,
                  ),
                  child: Form(
                    child: TextField(
                      obscureText: _obscureText,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFF4F8FB),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Color(0xFF999999),
                        ),
                        suffixIcon: IconButton(
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: 28,
                  ),
                  alignment: Alignment.centerRight,
                  child: Text('Forgot password ?'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 15,
                    left: 25,
                    right: 25,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width / 1, height / 14),
                      primary: Color(0xFFD6001B),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const BottomNavigation(),
                          transitionDuration: Duration(seconds: 0),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
    );
  }
}

// Flexible(
//               child: Container(
//                 height: MediaQuery.of(context).size.height / 2,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(50),
//                     topRight: Radius.circular(50),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(
//                         top: 40,
//                         left: 25,
//                       ),
//                       child: Text(
//                         'Login',
//                         style: TextStyle(
//                           fontSize: 30,
//                           color: Color(0xFFD6001B),
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(
//                         left: 28,
//                       ),
//                       child: Text(
//                         'Lets get started',
//                         style: TextStyle(
//                           color: Color(0xFF999999),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                         top: 20,
//                         right: 28,
//                         left: 28,
//                       ),
//                       child: Form(
//                         child: TextField(
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                             ),
//                             filled: true,
//                             fillColor: Color(0xFFF4F8FB),
//                             hintText: 'Mobile number',
//                             hintStyle: TextStyle(
//                               color: Color(0xFF999999),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                         top: 20,
//                         right: 28,
//                         left: 28,
//                       ),
//                       child: Form(
//                         child: TextField(
//                           obscureText: _obscureText,
//                           keyboardType: TextInputType.multiline,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                             ),
//                             filled: true,
//                             fillColor: Color(0xFFF4F8FB),
//                             hintText: 'Password',
//                             hintStyle: TextStyle(
//                               color: Color(0xFF999999),
//                             ),
//                             suffixIcon: IconButton(
//                               color: Colors.black,
//                               onPressed: () {
//                                 setState(() {
//                                   _obscureText = !_obscureText;
//                                 });
//                               },
//                               icon: Icon(
//                                 _obscureText
//                                     ? Icons.visibility_off
//                                     : Icons.visibility,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(
//                         right: 28,
//                       ),
//                       alignment: Alignment.centerRight,
//                       child: Text('Forgot password ?'),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(
//                         top: 15,
//                         left: 25,
//                         right: 25,
//                       ),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: Size(width / 1, height / 14),
//                           primary: Color(0xFFD6001B),
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             PageRouteBuilder(
//                               pageBuilder: (_, __, ___) =>
//                                   const BottomNavigation(),
//                               transitionDuration: Duration(seconds: 0),
//                               transitionsBuilder: (_, a, __, c) =>
//                                   FadeTransition(opacity: a, child: c),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           'LOGIN',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),