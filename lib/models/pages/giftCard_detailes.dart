import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallets_app/Pages/Screen/addFund.dart';
import 'package:wallets_app/Pages/Screen/buttom_navigation.dart';
import 'package:wallets_app/Pages/Screen/notifiations/notification.dart';
import 'package:wallets_app/Pages/Screen/otp_screen.dart';
import '../gift_card.dart';

//List for  dropdown menu..
List<String> list = [
  "Personal",
  "Agent",
];

class GiftCardFormPage extends StatefulWidget {
  final GiftCard _item;
  const GiftCardFormPage(this._item, {super.key});
  // const GiftCardFormPage({
  //   Key? key,
  // }) : super(key: key);

  @override
  State<GiftCardFormPage> createState() => _GiftCardFormPageState();
}

class _GiftCardFormPageState extends State<GiftCardFormPage> {
  bool isChecked = false;
  //
  //
  final _formValue = GlobalKey<FormState>();
  //
  String dropdownValue = list.first;
  int _pagestate = 0;
  var _backGroundColor = const Color(0xFFF4F8FB);

  double pinYoffset = 0;
  double windowWidth = 0;
  double windowHeight = 0;
  double _pinOpaity = 1;
  @override
  Widget build(BuildContext context) {
    //
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.black;
      }
      return Colors.black;
    }

    // Set height width (MediaQuery)
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    //Using switch Function....
    switch (_pagestate) {
      case 0:
        _backGroundColor = _backGroundColor;
        pinYoffset = windowHeight;
        _pinOpaity = 1;
        // windowHeight = windowHeight;
        // windowWidth = windowWidth;
        break;

      //
      //
      case 1:
        _backGroundColor = _backGroundColor;
        pinYoffset = 0;
        _pinOpaity = 0.7;
        //
        //

        break;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: _backGroundColor,

        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 150,
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const WelcomePage(),
                //   ),
                // );
              },
              child: SvgPicture.asset('assets/wallet_logo.svg'),
            ),
          ),
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
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => NotificationPage(),
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

        // Using Stack widget....(It is showing a PinScreen page....When click send button....)
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Stack(
            children: [
              //Using AnimatedConatner widgets...
              AnimatedContainer(
                height: windowHeight,
                width: windowWidth,
                color: _backGroundColor,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(
                  milliseconds: 1000,
                ),
                //ListView use kora hoyeche karon Page scroll korar jonno..
                child: ListView(
                  // ?
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //
                            // Back Button use...
                            Container(
                              alignment: Alignment.topLeft,
                              child: GestureDetector(
                                child: Container(
                                  // alignment: Alignment.topLeft,
                                  height: 38,
                                  width: 38,
                                  margin: const EdgeInsets.only(
                                    left: 48,
                                    top: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Color(0xFFF4F8FB),
                                    color: Colors.black,
                                  ),
                                  // margin: EdgeInsets.only(
                                  //   top: 7,
                                  //   left: 7,
                                  // ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Color(0xFFF4F8FB),
                                      // size: 35,
                                    ),
                                  ),
                                ),

                                //Call back for buttomNavigation Page...
                                onTap: () {
                                  // Navigator.pop(context);
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const BottomNavigation(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            //end of back button....

                            //
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Container(
                                //   height: 50,
                                //   margin: EdgeInsets.only(
                                //     left: 10,
                                //   ),
                                //   child: FloatingActionButton(
                                //     // backgroundColor: Colors.black,
                                //     backgroundColor: Color(0xFFF4F8FB),
                                //     onPressed: () {
                                //       Navigator.pop(context);
                                //     },
                                //     child: Icon(
                                //       Icons.arrow_back_outlined,
                                //       color: Colors.black,
                                //       size: 30,
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(
                                //   width: 50,
                                // ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return const AddFund();
                                        },
                                      ),
                                    );
                                  },
                                  child: SvgPicture.asset('images/tk.svg'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: const [
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
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 45),
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      widget._item.imgUrl,

                                      // width: 10,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: const Text(
                                    "Gift Card",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //3TextField using

                            Container(
                              margin: const EdgeInsets.only(
                                top: 50,
                                left: 50,
                              ),
                              alignment: Alignment.centerLeft,
                              child: const Text('E-mail Address'),
                            ),
                            Form(
                              key: _formValue,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 50,
                                  right: 50,
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0.7,
                                      horizontal: 13,
                                    ),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    hintText: widget._item.subtitle,
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  validator: (value) {
                                    RegExp('@');
                                    if (value!.isEmpty) {
                                      return "Enter your email";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 40),
                                    child: Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(
                                          () {
                                            isChecked = value!;
                                          },
                                        );
                                      },
                                    ),
                                    // child: Image.asset('assets/Group 147.png'),
                                    // child: Icon(
                                    //   Icons.check_box,
                                    // ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 0,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Text("Terms & Conditions"),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                bottom: 80,
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(windowWidth / 1.3, 50),
                                  primary: const Color(0xFFD6001B),
                                ),
                                onPressed: () {
                                  if (_formValue.currentState!.validate()) {
                                    if (isChecked) {
                                      setState(
                                        () {
                                          // _pagestate = 1;
                                          if (_pagestate != 1) {
                                            _pagestate = 1;
                                          } else {
                                            _pagestate = 0;
                                          }
                                        },
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.only(
                                              left: 50,
                                            ),
                                            alignment: Alignment.center,
                                            title: const Text(
                                              'Terms & Conditions',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            content: Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment
                                              //         .spaceAround,
                                              children: [
                                                // IconButton(
                                                //   onPressed: (() {}),
                                                //   icon: SvgPicture.asset(
                                                //     'assets/whatsApp.svg',
                                                //     // height: 30,
                                                //     color: Colors.green,
                                                //   ),
                                                //   // icon: Image.asset(
                                                //   //   'assets/Report.png',
                                                //   //   color: Colors.green,
                                                //   // ),
                                                // ),
                                                // SizedBox(
                                                //   width: 5,
                                                // ),
                                                InkWell(
                                                  onTap: () {
                                                    // launch(
                                                    //   "https://www.whatsapp.com",
                                                    // );
                                                    // setState(() {
                                                    //   // _launchURL();
                                                    // });
                                                  },
                                                  child: const Text(
                                                    '',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                                                    child: const Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      // launch("https://www.whatsapp.com");
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
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
                                    }
                                  }

                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (ctx) {
                                  //       return PaymentConfirm();
                                  //     },
                                  //   ),
                                  // );
                                },
                                child: const Text(
                                  "Send",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            // PinScreen(),
                            // SizedBox(
                            //   height: 25,
                            // ),
                            // Container(
                            //   height: 50,
                            //   margin: EdgeInsets.only(
                            //       // left: 50,
                            //       ),
                            //   alignment: Alignment.bottomCenter,
                            //   child: FloatingActionButton(
                            //     backgroundColor: Color(0xFFF4F8FB),
                            //     splashColor: Color(0xFFD6001B),
                            //     hoverColor: Colors.green,
                            //     // Color(0xFFD6001B),
                            //     onPressed: () {
                            //       Navigator.pushReplacement(
                            //         context,
                            //         PageRouteBuilder(
                            //           pageBuilder: (context, animation,
                            //               secondaryAnimation) {
                            //             return BottomNavigation();
                            //           },
                            //         ),
                            //       );
                            //     },
                            //     child: Icon(
                            //       Icons.arrow_back_outlined,
                            //       color: Colors.black,
                            //       size: 35,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Using gesterDetector ....
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      _pagestate = 0;
                    },
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 0,
                  ),
                  curve: Curves.easeInOutExpo,
                  // color: Colors.black,
                  transform: Matrix4.translationValues(0, pinYoffset, 0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(_pinOpaity),
                    // color: Colors.black,
                  ),

                  //PinScreen Widgest.....
                  child: OtpScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //   ),
    // );
  }
}
