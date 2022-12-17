// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallets_app/Pages/Screen/otp_screen.dart';
import 'package:wallets_app/models/services/create_form.dart';
import '../../Pages/Screen/addFund.dart';
import '../../Pages/Screen/buttom_navigation.dart';
import '../../Pages/Screen/notifiations/notification.dart';
import 'package:http/http.dart' as http;

import '../services/all_get_api.dart';

class BankFormPage extends StatefulWidget {
  final String name, logo, type;
  const BankFormPage(
      {Key? key, required this.name, required this.logo, required this.type})
      : super(key: key);

  @override
  State<BankFormPage> createState() => _BankFormPageState();
}

class _BankFormPageState extends State<BankFormPage> {
  bool isChecked = false;
//? Creating the controller for textFormFeilds.
  final _bankName = TextEditingController();
  final _amount = TextEditingController();
  final _bankAcountNumber = TextEditingController();
  final _bankAcountName = TextEditingController();
  final _branchName = TextEditingController();
//?
  Future<void> sendBankData(
      bankName, amount, baNumber, baName, branchName, is_trem) async {
    Map<String, String> data = {
      "bank_name": bankName,
      "amount": amount,
      "bank_account_number": baNumber,
      "bank_account_name": baName,
      "branch_name": branchName,
      "is_term": is_trem,
    };
    var responce = http.post(Uri.parse('http://zune360.com/request/banking/'),
        headers: {}, body: data);
    print(data);
  }
//?

  final _formValue = GlobalKey<FormState>();
  //
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
        backgroundColor: Colors.blue[50],
        // backgroundColor: Color.fromARGB(255, 243, 253, 255),
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 150,
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const BottomNavigation(),
                      transitionDuration: const Duration(seconds: 0),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                    // MaterialPageRoute(builder: (context) => BottomNavigation()),
                    (route) => false);
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
        body: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: _formValue,
            child: Stack(
              children: [
                AnimatedContainer(
                  height: windowHeight,
                  width: windowWidth,
                  color: _backGroundColor,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(
                    milliseconds: 1000,
                  ),
                  child: ListView(
                    children: [
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
                              padding: EdgeInsets.only(left: 10),
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
                      Container(
                        margin: const EdgeInsets.only(
                            // top: 60,
                            ),
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
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
                                    children: [
                                      FutureBuilder<int>(
                                        future: getBalance(
                                            "http://zune360.com/api/user/current_balance/"),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(
                                              snapshot.data.toString(),
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
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 45),
                                    height: 95,
                                    width: 95,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          widget.logo,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Text(
                                      widget.type,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 48,
                                  bottom: 10,
                                ),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Bank Name',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Container(
                                // height: 48,
                                margin: const EdgeInsets.only(
                                  left: 48,
                                  right: 48,
                                ),
                                child: CreateFormFeild(
                                  hint: "Enter Bank Name",
                                  kytype: TextInputType.multiline,
                                  controller: _bankName,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your bank name';
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 48,
                                  bottom: 10,
                                ),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Account Number',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Container(
                                // height: 48,
                                margin: const EdgeInsets.only(
                                  left: 48,
                                  right: 48,
                                ),
                                child: CreateFormFeild(
                                  hint: "Enter Accoount Number",
                                  kytype: TextInputType.number,
                                  controller: _bankAcountNumber,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your account number';
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 48,
                                  bottom: 10,
                                ),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Account Name',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Container(
                                // height: 48,
                                margin: const EdgeInsets.only(
                                  left: 48,
                                  right: 48,
                                ),
                                child: CreateFormFeild(
                                  hint: "Enter Accoount Name",
                                  kytype: TextInputType.multiline,
                                  controller: _bankAcountName,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your account name';
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 48,
                                  bottom: 10,
                                ),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Branch Name',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Container(
                                // height: 48,
                                margin: const EdgeInsets.only(
                                  left: 48,
                                  right: 48,
                                ),
                                child: CreateFormFeild(
                                  hint: "Enter Branch Name",
                                  kytype: TextInputType.multiline,
                                  controller: _branchName,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your branch name';
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 48,
                                  bottom: 10,
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              Container(
                                // height: 48,
                                margin: const EdgeInsets.only(
                                  left: 48,
                                  right: 48,
                                ),
                                child: CreateFormFeild(
                                  hint: "Amount",
                                  kytype: TextInputType.number,
                                  controller: _amount,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your amount';
                                    }
                                  },
                                ),
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
                                height: 10,
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  bottom: 80,
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(windowWidth * 0.77, 50),
                                    primary: const Color(0xFFD6001B),
                                  ),
                                  onPressed: () {
                                    if (_formValue.currentState!.validate()) {
                                      if (isChecked) {
//?
                                        sendBankData(
                                          _bankName.text,
                                          _amount.text,
                                          _bankAcountNumber.text,
                                          _bankAcountName.text,
                                          _branchName.text,
                                          isChecked.toString(),
                                        );
//?
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
                                              content: Container(
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {},
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
                                      print('Done');
                                    }
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
                        print('OnClick');
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
                    child: const OtpScreen(),
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




// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// // import 'package:wallets_app/Pages/WelcomePage.dart';
// import 'package:wallets_app/models/Bank.dart';

// import '../../Pages/Screen/notification.dart';
// import '../../Pages/Screen/otp_screen.dart';
// // import '../../Pages/Screen/payment_confirm.dart';
// import '../../Pages/widgets/check_box.dart';

// class BankFormPage extends StatefulWidget {
//   // const BankFormPage({Key? key}) : super(key: key);
//   final Bank bankList;
//   BankFormPage(this.bankList);

//   @override
//   State<BankFormPage> createState() => _BankFormPageState();
// }

// class _BankFormPageState extends State<BankFormPage> {
//   //
//   final _formValue = GlobalKey<FormState>();
//   //Otp screens values....
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
//     //Using switch fuctions for Screen opacity....
//     switch (_pageState) {
//       case 0:
//         _pinYoffset = windowHeight;
//         ;
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
//       top: false,
//       child: Scaffold(
//         backgroundColor: _backGroundColor,
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
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => WelcomePage(),
//                 //   ),
//                 // );
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
//         body: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: Stack(
//             children: [
//               SingleChildScrollView(
//                 // children: [
//                 child: Container(
//                   margin: EdgeInsets.only(
//                     top: 50,
//                   ),
//                   child: Center(
//                     child: Form(
//                       key: _formValue,
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Container(
//                                 height: 50,
//                                 margin: EdgeInsets.only(
//                                   left: 30,
//                                 ),
//                                 child: FloatingActionButton(
//                                   splashColor: Color(0xFFD6001B),
//                                   // backgroundColor: Colors.black,
//                                   backgroundColor: Color(0xFFF4F8FB),
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   child: Icon(
//                                     Icons.arrow_back_outlined,
//                                     color: Colors.black,
//                                     size: 30,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 50,
//                               ),
//                               SvgPicture.asset("images/tk.svg"),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     '10,00,000 BDT',
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     'Current balance',
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(left: 45),
//                                 height: 70,
//                                 width: 70,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.white,
//                                   // image: DecorationImage(
//                                   //   image: AssetImage(
//                                   //     "assets/bKash_logo.png",
//                                   //   ),
//                                   // ),
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.all(5.0),
//                                   child: Image.asset(
//                                     widget.bankList.imgUrl,
//                                     // height: 20,

//                                     // "assets/bKash_logo.png",

//                                     // height: 20,
//                                     // width: 20,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.only(
//                                   left: 20,
//                                 ),
//                                 child: Text(
//                                   "Bank",
//                                   style: TextStyle(
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                               left: 48,
//                               bottom: 10,
//                             ),
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Bank Name',
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             // height: 48,
//                             margin: EdgeInsets.only(
//                               left: 48,
//                               right: 48,
//                             ),
//                             child: TextFormField(
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return 'Please enter some text';
//                                 }
//                               },
//                               keyboardType: TextInputType.multiline,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(
//                                   vertical: 0.4,
//                                   horizontal: 13,
//                                 ),
//                                 fillColor: Color(0xFFEFF0F1),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 filled: true,
//                                 hintText: widget.bankList.label,
//                                 hintStyle: TextStyle(
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                               left: 48,
//                               bottom: 10,
//                             ),
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Account Number',
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             // height: 48,
//                             margin: EdgeInsets.only(
//                               left: 48,
//                               right: 48,
//                             ),
//                             child: TextFormField(
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return 'Please enter some number';
//                                 }
//                               },
//                               keyboardType: TextInputType.number,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(
//                                   vertical: 0.4,
//                                   horizontal: 13,
//                                 ),
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 filled: true,
//                                 hintText: "Enter Account Number",
//                                 hintStyle: TextStyle(
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                               left: 48,
//                               bottom: 10,
//                             ),
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Account Name',
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             // height: 48,
//                             margin: EdgeInsets.only(
//                               left: 48,
//                               right: 48,
//                             ),
//                             child: TextFormField(
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return 'Please enter some text';
//                                 }
//                               },
//                               keyboardType: TextInputType.multiline,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(
//                                   vertical: 0.4,
//                                   horizontal: 13,
//                                 ),
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 filled: true,
//                                 hintText: "Enter Account Name",
//                                 hintStyle: TextStyle(
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                               left: 48,
//                               bottom: 10,
//                             ),
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Branch Name',
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             // height: 48,
//                             margin: EdgeInsets.only(
//                               left: 48,
//                               right: 48,
//                             ),
//                             child: TextFormField(
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return 'Please enter some text';
//                                 }
//                               },
//                               keyboardType: TextInputType.multiline,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(
//                                   vertical: 0.4,
//                                   horizontal: 13,
//                                 ),
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 filled: true,
//                                 hintText: "Enter Branch Name",
//                                 hintStyle: TextStyle(
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                               left: 48,
//                               bottom: 10,
//                             ),
//                             alignment: Alignment.centerLeft,
//                             // child: Text(
//                             //   'Bank Name',
//                             //   style: TextStyle(
//                             //     fontSize: 15,
//                             //   ),
//                             // ),
//                           ),
//                           Container(
//                             // height: 48,
//                             margin: EdgeInsets.only(
//                               left: 48,
//                               right: 48,
//                             ),
//                             child: TextFormField(
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return 'Please enter some number';
//                                 }
//                               },
//                               keyboardType: TextInputType.number,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(
//                                   vertical: 0.4,
//                                   horizontal: 13,
//                                 ),
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 filled: true,
//                                 hintText: "Amount",
//                                 hintStyle: TextStyle(
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {},
//                                 child: Container(
//                                   margin: EdgeInsets.only(left: 45),
//                                   child: CheakBoxWidgets(),
//                                   // child: Image.asset('assets/Group 147.png'),
//                                   // child: Icon(
//                                   //   Icons.check_box,
//                                   // ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Container(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text("Terms & Conditions"),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                               bottom: 80,
//                             ),
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 minimumSize: Size(290, 50),
//                                 primary: Color(0xFFD6001B),
//                               ),
//                               onPressed: () {
//                                 if (_formValue.currentState!.validate()) {
//                                   setState(
//                                     () {
//                                       // _pageState = 1;
//                                       if (_pageState != 1) {
//                                         _pageState = 1;
//                                       }
//                                     },
//                                   );
//                                 }
//                                 // Navigator.of(context).push(
//                                 //   PageRouteBuilder(
//                                 //     opaque: false, // set to false
//                                 //     pageBuilder: (_, __, ___) => OtpScreen(),
//                                 //   ),
//                                 // );
//                               },
//                               child: Text(
//                                 "Send",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   // setState(
//                   //   () {
//                   //     _pageState = 0;
//                   //     // if (_pageState != 1) {
//                   //     //   _pageState = 1;
//                   //     // } else {
//                   //     //   _pageState = 0;
//                   //     // }
//                   //     // print('Click MotherF**ker');
//                   //   },
//                   // );
//                 },
//                 child: AnimatedContainer(
//                   curve: Curves.linear,
//                   duration: Duration(
//                     milliseconds: 0,
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
