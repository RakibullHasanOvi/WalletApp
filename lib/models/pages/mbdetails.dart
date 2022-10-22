import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallets_app/Pages/Screen/buttom_navigation.dart';
// import 'package:wallet_ui/Pages/screen/pin_screen.dart';
// import 'package:wallet_ui/Pages/widgets/cheak_box.dart';
import 'package:wallets_app/Pages/Screen/otp_screen.dart';
import 'package:wallets_app/Pages/widgets/dropdown_menu.dart';
import 'package:wallets_app/models/MobileBanking.dart';

import '../../Pages/Screen/notification.dart';
import '../../Pages/WelcomePage.dart';
import '../../Pages/widgets/check_box.dart';
// import '../../Pages/screen/notificatio_page.dart';
// import '../../Pages/welcome_page.dart';
// import '../mobile_banking.dart';

//List for  dropdown menu..
List<String> list = [
  "Personal",
  "Agent",
];

class MobileBankingFormPage extends StatefulWidget {
  final MobileBanking _itemsList;
  MobileBankingFormPage(this._itemsList);
  // const MobileBankingFormPage({
  //   Key? key,
  // }) : super(key: key);

  @override
  State<MobileBankingFormPage> createState() => _MobileBankingFormPageState();
}

class _MobileBankingFormPageState extends State<MobileBankingFormPage> {
  //
  final _formValue = GlobalKey<FormState>();
  //
  String dropdownValue = list.first;
  int _pagestate = 0;
  var _backGroundColor = Color(0xFFF4F8FB);

  double pinYoffset = 0;
  double windowWidth = 0;
  double windowHeight = 0;
  double _pinOpaity = 1;
  @override
  Widget build(BuildContext context) {
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
        _pinOpaity = 0.9;
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
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => NotificationPage(),
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
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              //Using AnimatedConatner widgets...
              AnimatedContainer(
                height: windowHeight,
                width: windowWidth,
                color: _backGroundColor,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(
                  milliseconds: 1000,
                ),
                //ListView use kora hoyeche karon Page scroll korar jonno..
                child: ListView(
                  // ?
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Center(
                        //Using form...
                        child: Form(
                          key: _formValue, //form for key...
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Container(
                                  //   height: 50,
                                  //   margin: EdgeInsets.only(
                                  //     left: 40,
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
                                  SvgPicture.asset('images/tk.svg'),
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
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 45),
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      // image: DecorationImage(
                                      //   image: AssetImage(
                                      //     "assets/bKash_logo.png",
                                      //   ),
                                      // ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        widget._itemsList.imgUrl,
                                        // height: widget._itemsList.height,
                                        // width: widget._itemsList.width,
                                        // height: 20,

                                        // "assets/bKash_logo.png",

                                        // height: 10,
                                        // width: 10,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Text(
                                      "Mobile Banking",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              //1st TextField's ccontainer...
                              Container(
                                margin: EdgeInsets.symmetric(
                                  // vertical: 15,
                                  horizontal: 50,
                                ),
                                // height: 60,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  // textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 10,
                                    ),
                                    fillColor: Colors.white,
                                    prefixIcon: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        // height: 58,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.blue,
                                        ),
                                        child: Image.asset(
                                          'assets/user-plus.png',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    hintText: "Search phonebook...",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                  },
                                ),
                              ),

                              //2nd TextField usign paddig...
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 50,
                                ),
                                // height: 40,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      // vertical: 10,
                                      horizontal: 13,
                                    ),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    hintText: widget._itemsList.label,
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                  },
                                ),
                              ),

                              //3rd TextField using padding....

                              Container(
                                margin: EdgeInsets.symmetric(
                                  // vertical: 2,
                                  horizontal: 50,
                                ),

                                // height: 40,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 13,
                                    ),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    hintText: "Amount",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                  },
                                ),
                              ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 45,
                                ),
                                child: DropdownMenuWidget(),
                              ),

                              //DropDown er jonno containner newa hoise..
                              // Container(
                              //   // decoration: BoxDecoration(
                              //   //   color: Colors.white,
                              //   //   borderRadius: BorderRadius.circular(20),
                              //   // ),
                              //   alignment: Alignment.centerLeft,
                              //   margin: EdgeInsets.only(left: 55),
                              //   child: DropdownButton(
                              //     borderRadius: BorderRadius.circular(20),
                              //     dropdownColor: Colors.white,
                              //     value: dropdownValue,
                              //     icon: const Icon(Icons.arrow_drop_down_sharp),
                              //     // elevation: 16,
                              //     // style: TextStyle(color: Colors.deepPurple),
                              //     // underline: Container(
                              //     //   height: 2,
                              //     //   color: Colors.deepPurpleAccent,
                              //     // ),
                              //     onChanged: (String? value) {
                              //       // This is called when the user selects an item.
                              //       setState(() {
                              //         dropdownValue = value!;
                              //       });
                              //     },
                              //     items: list.map<DropdownMenuItem<String>>(
                              //         (String value) {
                              //       return DropdownMenuItem(
                              //         value: value,
                              //         child: Text(value),
                              //       );
                              //     }).toList(),
                              //   ),
                              // ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.only(left: 40),
                                      child: CheakBoxWidgets(),
                                      // child: Image.asset('assets/Group 147.png'),
                                      // child: Icon(
                                      //   Icons.check_box,
                                      // ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Terms & Conditions"),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 20,
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(290, 50),
                                    primary: Color(0xFFD6001B),
                                  ),
                                  onPressed: () {
                                    if (_formValue.currentState!.validate()) {
                                      setState(
                                        () {
                                          _pagestate = 1;
                                          if (_pagestate == 0) {
                                            _pagestate = 1;
                                          }
                                          // else {
                                          //   _pagestate = 0;
                                          // }
                                        },
                                      );
                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(
                                      //   const SnackBar(
                                      //     content: Text('Processing Data'),
                                      //   ),
                                      // );
                                    }
                                    // if (_formValue.currentState!.validate()) {
                                    //   return

                                    // } else {
                                    //   print('Error');
                                    // }

                                    // setState(
                                    //   () {
                                    //     // _pagestate = 1;
                                    //     if (_pagestate != 1) {
                                    //       _pagestate = 1;
                                    //     } else {
                                    //       _pagestate = 0;
                                    //     }
                                    //   },
                                    // );
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (ctx) {
                                    //       return const PinScreen();
                                    //       // return PaymentConfirm();
                                    //     },
                                    //   ),
                                    // );
                                  },
                                  child: Text(
                                    "Send",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              // PinScreen(),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                margin: EdgeInsets.only(
                                  left: 50,
                                ),
                                alignment: Alignment.bottomLeft,
                                child: FloatingActionButton(
                                  backgroundColor: Color(0xFFF4F8FB),
                                  splashColor: Color(0xFFD6001B),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return BottomNavigation();
                                        },
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.arrow_back_outlined,
                                    color: Colors.black,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Using gesterDetector ....
              GestureDetector(
                // onTap: () {
                //   setState(
                //       // () {
                //       //   _pagestate = 0;
                //       //   print('OnClick');
                //       },
                //       );
                // },
                child: AnimatedContainer(
                  duration: Duration(
                    milliseconds: 0,
                  ),
                  curve: Curves.easeInOutExpo,
                  // color: Colors.black,
                  transform: Matrix4.translationValues(0, pinYoffset, 0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
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

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:wallets_app/Pages/Screen/otp_screen.dart';
// import 'package:wallets_app/Pages/widgets/dropdown_menu.dart';
// // import '../../Pages/Screen/payment_confirm.dart';
// import '../../Pages/Screen/notification.dart';
// import '../../Pages/WelcomePage.dart';
// import '../../Pages/widgets/check_box.dart';
// import '../MobileBanking.dart';

// //Seleted Button list

// List<String> list = [
//   "Personal",
//   "Agent",
// ];

// class MobileBankingFormPage extends StatefulWidget {
//   // Call Mobile Banking list

//   final MobileBanking _itemsList;
//   MobileBankingFormPage(this._itemsList);
//   // const MobileBankingFormPage({
//   //   Key? key,
//   // }) : super(key: key);

//   @override
//   State<MobileBankingFormPage> createState() => _MobileBankingFormPageState();
// }

// class _MobileBankingFormPageState extends State<MobileBankingFormPage> {
//   String dropdownValue = list.first;
//   //
//   //
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   //
//   double _pinYoffset = 0;
//   double _pinOpacity = 1;
//   int _pageState = 0;
//   var _backGroundColor = Color(0xFFF4F8FB);
//   double windowWidth = 0;
//   double windowHeight = 0;

//   @override
//   Widget build(BuildContext context) {
//     windowHeight = MediaQuery.of(context).size.height;
//     windowWidth = MediaQuery.of(context).size.width;
//     switch (_pageState) {
//       case 0:
//         _pinYoffset = windowHeight;
//         _pinOpacity = 1;
//         _backGroundColor = _backGroundColor;
//         break;

//       case 1:
//         _backGroundColor = _backGroundColor;
//         _pinYoffset = 0;
//         _pinOpacity = 0.7;
//         break;
//     }

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xFFF4F8FB),
//         // backgroundColor: Colors.blue[50],
//         // backgroundColor: Color.fromARGB(255, 243, 253, 255),
//         appBar: AppBar(
//           centerTitle: false,
//           elevation: 0,
//           backgroundColor: Colors.white,
//           leadingWidth: 150,
//           leading: Container(
//             margin: EdgeInsets.only(left: 10),
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => WelcomePage(),
//                   ),
//                 );
//               },
//               child: SvgPicture.asset(
//                 "assets/wallet_logo.svg",
//                 // color: Colors.red,
//               ),
//             ),
//           ),
//           actions: [
//             Container(
//               padding: EdgeInsets.only(
//                 right: 4,
//               ),
//               child: IconButton(
//                 iconSize: 10,
//                 icon: SvgPicture.asset(
//                   'images/Notification.svg',
//                   height: 22,
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     PageRouteBuilder(
//                       pageBuilder: (_, __, ___) => NotificationPage(),
//                       transitionDuration: Duration(seconds: 0),
//                       transitionsBuilder: (_, a, __, c) =>
//                           FadeTransition(opacity: a, child: c),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),

//         // Now Start body's work..

//         body: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: Stack(
//             children: [
//               ListView(
//                 children: [
//                   Container(
//                     height: windowHeight,
//                     width: windowWidth,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       // ?
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(top: 40),
//                           child: Center(
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SvgPicture.asset('images/tk.svg'),
//                                     // Image.asset('assets/tk.png'),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Column(
//                                       children: [
//                                         Text(
//                                           '10,00,000 BDT',
//                                           style: TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Text(
//                                           'Current balance',
//                                           style: TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.normal,
//                                           ),
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 60,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Container(
//                                       margin: EdgeInsets.only(left: 45),
//                                       height: 70,
//                                       width: 70,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20),
//                                         color: Colors.white,
//                                         // image: DecorationImage(
//                                         //   image: AssetImage(
//                                         //     "assets/bKash_logo.png",
//                                         //   ),
//                                         // ),
//                                       ),
//                                       child: Padding(
//                                         padding: EdgeInsets.all(5.0),
//                                         // child: SvgPicture.asset(
//                                         //     'images/bank_image/AB_bank.svg'),
//                                         child: Image.asset(
//                                           widget._itemsList.imgUrl,
//                                           // height: 20,

//                                           // "assets/bKash_logo.png",

//                                           //   height: 20,
//                                           //   width: 20,
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       margin: EdgeInsets.only(
//                                         left: 20,
//                                       ),
//                                       child: Text(
//                                         "Mobile Banking",
//                                         style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.normal,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Container(
//                                   // height: 40,
//                                   margin: EdgeInsets.only(
//                                     top: 30,
//                                     left: 50,
//                                     right: 50,
//                                     bottom: 20,
//                                   ),
//                                   // height: 60,
//                                   child: Form(
//                                     key: formKey,
//                                     child: TextFormField(
//                                       //   // Validation for using in phonebook...
//                                       validator: (value) {
//                                         if (value!.isEmpty ||
//                                             RegExp(r'^[0-9]+$')
//                                                 .hasMatch(value)) {
//                                           return "Enter your mobile number";
//                                         } else {
//                                           return null;
//                                         }
//                                       },

//                                       textAlign: TextAlign.center,
//                                       keyboardType: TextInputType.number,
//                                       decoration: InputDecoration(
//                                         contentPadding: EdgeInsets.symmetric(
//                                           vertical: 5,
//                                         ),
//                                         fillColor: Colors.white,
//                                         prefixIcon: GestureDetector(
//                                           onTap: () {},
//                                           child: Container(
//                                             // height: ,
//                                             // width: 42,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                               color: Colors.blue,
//                                             ),
//                                             child: Padding(
//                                               padding: EdgeInsets.all(9.0),
//                                               child: SvgPicture.asset(
//                                                 'images/user-plus.svg',
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                           borderSide: BorderSide.none,
//                                         ),
//                                         filled: true,
//                                         hintText: "Search phonebook...",
//                                         hintStyle: TextStyle(
//                                           color: Colors.grey,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     top: 30,
//                                     left: 50,
//                                     right: 50,
//                                     // bottom: 50,
//                                   ),
//                                   child: Container(
//                                     // height:0,
//                                     child: Form(
//                                       key: formKey,
//                                       child: TextFormField(
//                                         validator: (value) {
//                                           if (value!.isEmpty ||
//                                               RegExp(r'^[0-9]+$')
//                                                   .hasMatch(value)) {
//                                             return "Enter your mobile number";
//                                           } else {
//                                             return null;
//                                           }
//                                         },
//                                         keyboardType: TextInputType.number,
//                                         decoration: InputDecoration(
//                                           contentPadding: EdgeInsets.symmetric(
//                                               vertical: 5, horizontal: 15),
//                                           fillColor: Colors.white,
//                                           border: OutlineInputBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                             borderSide: BorderSide.none,
//                                           ),
//                                           filled: true,
//                                           hintText: widget._itemsList.label,
//                                           hintStyle: TextStyle(
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     top: 20,
//                                     left: 50,
//                                     right: 50,
//                                   ),
//                                   child: Container(
//                                     height: 40,
//                                     child: TextFormField(
//                                       keyboardType: TextInputType.number,
//                                       decoration: InputDecoration(
//                                         contentPadding: EdgeInsets.symmetric(
//                                             vertical: 5, horizontal: 15),
//                                         fillColor: Colors.white,
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                           borderSide: BorderSide.none,
//                                         ),
//                                         filled: true,
//                                         hintText: "Amount",
//                                         hintStyle: TextStyle(
//                                           color: Colors.grey,
//                                         ),
//                                       ),
//                                       // key: formKey,
//                                       // validator: (value) {
//                                       //   if (value!.isEmpty) {
//                                       //     //  ||RegExp(r'^[0-9]+$')
//                                       //     //     .hasMatch(value)) {
//                                       //     return "Enter your mobile number";
//                                       //   } else {
//                                       //     return null;
//                                       //   }
//                                       // },
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.symmetric(horizontal: 50),
//                                   alignment: Alignment.centerLeft,
//                                   child: DropdownMenuWidget(),
//                                 ),
//                                 // Container(
//                                 //   // decoration: BoxDecoration(
//                                 //   //   color: Colors.white,
//                                 //   //   borderRadius: BorderRadius.circular(20),

//                                 //   // ),
//                                 //   alignment: Alignment.centerLeft,
//                                 //   margin: EdgeInsets.only(left: 55),
//                                 //   child: DropdownButton(
//                                 //     // hint: Text('Select'),
//                                 //     // focusColor: Colors.blue,

//                                 //     // itemHeight: 4,
//                                 //     // underline: ,
//                                 //     borderRadius: BorderRadius.circular(20),
//                                 //     dropdownColor: Colors.white,
//                                 //     value: dropdownValue,
//                                 //     icon: Icon(Icons.arrow_drop_down),
//                                 //     // elevation: 16,
//                                 //     // style: TextStyle(color: Colors.deepPurple),
//                                 //     // underline: Container(
//                                 //     //   height: 2,
//                                 //     //   color: Colors.deepPurpleAccent,
//                                 //     // ),
//                                 //     onChanged: (String? value) {
//                                 //       // This is called when the user selects an item.
//                                 //       setState(() {
//                                 //         dropdownValue = value!;
//                                 //       });
//                                 //     },
//                                 //     items: list.map<DropdownMenuItem<String>>(
//                                 //         (String value) {
//                                 //       return DropdownMenuItem(
//                                 //         value: value,
//                                 //         child: Text(value),
//                                 //       );
//                                 //     }).toList(),
//                                 //   ),
//                                 // ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () {},
//                                       child: Container(
//                                         margin: EdgeInsets.only(left: 45),
//                                         child: CheakBoxWidgets(),

//                                         // child: Image.asset('assets/Group 147.png'),
//                                         // child: Icon(
//                                         //   Icons.check_box,
//                                         // ),
//                                       ),
//                                     ),
//                                     // SizedBox(
//                                     //   width: 10,
//                                     // ),
//                                     Container(
//                                       // alignment: Alignment.centerLeft,
//                                       child: Text("Terms & Conditions"),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 30,
//                                 ),
//                                 ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     minimumSize: Size(windowHeight / 2.8, 50),
//                                     primary: Color.fromARGB(255, 237, 29, 14),
//                                   ),
//                                   onPressed: () {
//                                     if (formKey.currentState!.validate()) {
//                                       setState(() {
//                                         // _pageState = 1;
//                                         if (_pageState != 0) {
//                                           _pageState = 0;
//                                         } else {
//                                           _pageState = 1;
//                                         }
//                                       });
//                                     }
//                                     // Navigator.of(context).push(
//                                     //   PageRouteBuilder(
//                                     //     opaque: false, // set to false
//                                     //     pageBuilder: (_, __, ___) => OtpScreen(),
//                                     //   ),
//                                     // );
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //     builder: (ctx) {
//                                     //       return OtpScreen();
//                                     //     },
//                                     //   ),
//                                     // );
//                                   },
//                                   child: Text(
//                                     "Send",
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(
//                     () {
//                       _pageState = 0;
//                       // if (_pageState != 1) {
//                       //   _pageState = 1;
//                       // } else {
//                       //   _pageState = 0;
//                       // }
//                       // print('Click MotherF**ker');
//                     },
//                   );
//                 },
//                 child: AnimatedContainer(
//                   curve: Curves.linear,
//                   duration: Duration(
//                     milliseconds: 1000,
//                   ),
//                   color: Colors.white.withOpacity(_pinOpacity),
//                   transform: Matrix4.translationValues(0, _pinYoffset, 0),
//                   child: OtpScreen(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
