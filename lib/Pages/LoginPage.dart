import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Screen/buttom_navigation.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'buttom_navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //
  final fromkey = GlobalKey<FormState>(); //  for form key...

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      top: false,
      // bottom: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          // key: _scaffoldKey,
          backgroundColor: Color(0xFFD6001B),
          body: SingleChildScrollView(
            child: Container(
              height: height,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      child: SvgPicture.asset(
                        'assets/wallet_logo_w.svg',
                        height: height / 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    // height: MediaQuery.of(context).size.height / 6,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 380,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Form(
                          // autovalidateMode: _obscureText,
                          key: fromkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 40,
                                  left: 25,
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xFFD6001B),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 28,
                                ),
                                child: const Text(
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
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your number";
                                    } else {
                                      return null;
                                    }
                                    // if (value!.isEmpty ||
                                    //     RegExp(r'^[a-z A-Z]+$')
                                    //         .hasMatch(value)) {
                                    //   return "Enter your mobile number";
                                    // } else {
                                    //   return null;
                                    // }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(12),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(238, 230, 241, 244),
                                    hintText: 'Mobile number',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 20,
                                  right: 28,
                                  left: 28,
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    // RegExp regex = RegExp(
                                    //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                    if (value!.isEmpty) {
                                      return "Enter your password";
                                    }
                                    if (value.length < 5) {
                                      return 'Must be use 5 characters';
                                    }
                                  },
                                  obscureText: _obscureText,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(12),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(238, 230, 241, 244),
                                    hintText: 'Password',
                                    suffixIcon: IconButton(
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
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 28),

                                    //I am using AlertDialouge box.....

                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              contentPadding: EdgeInsets.only(
                                                left: 50,
                                              ),
                                              alignment: Alignment.center,
                                              title: Text(
                                                'Contact us',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              content: Container(
                                                margin: EdgeInsets.only(
                                                  top: 20,
                                                ),
                                                // color: Colors.green,
                                                child: Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment
                                                  //         .spaceAround,
                                                  children: [
                                                    IconButton(
                                                      onPressed: (() {}),
                                                      icon: SvgPicture.asset(
                                                        'assets/whatsApp.svg',
                                                        // height: 30,
                                                        color: Colors.green,
                                                      ),
                                                      // icon: Image.asset(
                                                      //   'assets/Report.png',
                                                      //   color: Colors.green,
                                                      // ),
                                                    ),
                                                    // SizedBox(
                                                    //   width: 5,
                                                    // ),
                                                    InkWell(
                                                      onTap: () {
                                                        launch(
                                                          "https://www.whatsapp.com",
                                                        );
                                                        // setState(() {
                                                        //   // _launchURL();
                                                        // });
                                                      },
                                                      child: Text(
                                                        '01717256199',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        launch(
                                                            "https://api.whatsapp.com/send/?phone=01717256199&text&type=phone_number&app_absent=0");
                                                      },
                                                      child: Text(
                                                        'Ok',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },

                                      // onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   PageRouteBuilder(
                                      //     pageBuilder: (_, __, ___) =>
                                      //         const ChangePinPage(),
                                      //     transitionDuration:
                                      //         const Duration(seconds: 0),
                                      //     transitionsBuilder: (_, a, __, c) =>
                                      //         FadeTransition(opacity: a, child: c),
                                      //   ),
                                      // );
                                      //
                                      // Navigator.pushAndRemoveUntil(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ChangePinPage()),
                                      //     (route) => false);
                                      // },
                                      child: Text('Forgot password ?'),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  left: 25,
                                  right: 25,
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(width / 1, 50),
                                    primary: const Color(0xFFD6001B),
                                  ),
                                  onPressed: () {
                                    if (fromkey.currentState!.validate()) {
                                      //   final snackBar = SnackBar(
                                      //     content: Text('Login sucessfully'),
                                      //   );
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                const BottomNavigation(),
                                            // transitionDuration:
                                            //     const Duration(seconds: 0),
                                            // transitionsBuilder: (_, a, __, c) =>
                                            //     FadeTransition(
                                            //         opacity: a, child: c),
                                          ),
                                          (route) => false);
                                      // Navigator.push(
                                      //   context,
                                      //   PageRouteBuilder(
                                      //     pageBuilder: (_, __, ___) =>
                                      //         const BottomNavigation(),
                                      //     transitionDuration:
                                      //         const Duration(seconds: 0),
                                      //     transitionsBuilder: (_, a, __, c) =>
                                      //         FadeTransition(
                                      //             opacity: a, child: c),
                                      //   ),
                                      // );
                                      // }
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => BottomNavigation(),
                                      //   ),
                                      // );
                                    }
                                  },
                                  child: const Text(
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
