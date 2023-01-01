import 'dart:io';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallets_app/Pages/Screen/addFund.dart';
import 'package:wallets_app/Pages/Screen/buttom_navigation.dart';
import 'package:wallets_app/Pages/Screen/notifiations/notification.dart';
import 'package:wallets_app/Pages/Screen/otp_screen.dart';
import 'package:http/http.dart' as http;
import 'package:wallets_app/models/services/all_get_api.dart';
import 'package:wallets_app/models/services/typeAhed.dart';

class RechargeFormPage extends StatefulWidget {
//!Caling recharge item...
  final String name, logo, type;
  const RechargeFormPage({
    Key? key,
    required this.name,
    required this.logo,
    required this.type,
  }) : super(key: key);

  @override
  State<RechargeFormPage> createState() => _RechargeFormPageState();
}

class _RechargeFormPageState extends State<RechargeFormPage> {
//
  final stroge = FlutterSecureStorage();
  final _formValue = GlobalKey<FormState>();
  bool isChecked = false;
  String value = '';
  final _sugestionfieldController = TextEditingController();
  final _amount = TextEditingController();
  var getIp;

  Future callingIp() async {
    getIp = await Ipify.ipv4();
    setState(() {});
  }

//? Send Mobile Recharge data..
  Future<void> sendRechargeData(
      number, amount, is_trem, choise, mrName, addLogo, ipAddress) async {
    Map<String, String> data = {
      "phone_number": number,
      "amount": amount,
      "is_term": is_trem,
      "choice": choise,
      "bank_name": mrName,
      "add_logo": addLogo,
      "ip_address": ipAddress.toString(),
    };
    var showToken = await stroge.read(key: 'token');
    var responce =
        await http.post(Uri.parse('http://zune360.com/request/mobilercharge/'),
            headers: {
              HttpHeaders.authorizationHeader: "token $showToken",
            },
            body: data);
    print(data);
    if (responce.statusCode == 200) {
      print('Success');
    } else {
      print('Check it some problem');
    }
  }
//?

  double _pinYoffset = 0;
  double _pinOpacity = 1;
  int _pageState = 0;
  var _backGroundColor = const Color(0xFFF4F8FB);
  double width = 0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
//Terms and conditions....
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

//Finished...

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
//!Pages changed works...
    switch (_pageState) {
      case 0:
        _pinYoffset = height;
        ;
        _pinOpacity = 1;
        _backGroundColor = _backGroundColor;
        break;

      case 1:
        _backGroundColor = _backGroundColor;
        _pinYoffset = 0;
        _pinOpacity = 0.7;
        break;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F8FB),
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => WelcomePage(),
                //   ),
                // );
              },
              child: SvgPicture.asset(
                "assets/wallet_logo.svg",
                // color: Colors.red,
              ),
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
        body: GestureDetector(
          onTap: () {
            callingIp();
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 0),
                    // height: height,
                    // width: width,
                    child: Column(
                      // ?
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Form(
                            key: _formValue,
                            child: Column(
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
                                      children: [
                                        FutureBuilder<int>(
                                          future: getBalance(
                                              "http://zune360.com/api/user/current_balance/"),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                '\৳ ' +
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
                                  height: 60,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 45),
                                      height: 95,
                                      width: 95,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
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
                                  height: 30,
                                ),
                                Container(
                                  // height: 40,
                                  // width: ,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 50,
                                    // top: 30,
                                    // left: 50,
                                    // right: 50,
                                  ),
                                  // height: 60,
                                  child: TAfeild(
                                      sugestionfieldController:
                                          _sugestionfieldController),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    left: 50,
                                    right: 50,
                                  ),
                                  child: TextFormField(
                                    controller: _sugestionfieldController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: .5,
                                        horizontal: 15,
                                      ),
                                      filled: true,
                                      hintText: widget.name,
                                      hintStyle: const TextStyle(
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 50,
                                    right: 50,
                                  ),
                                  child: TextFormField(
                                    controller: _amount,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: .5,
                                        horizontal: 15,
                                      ),
                                      filled: true,
                                      hintText: "Amount",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter some number';
                                      }
                                    },
                                  ),
                                ),

                                // Select Dropdown menu......

                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 45,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DropdownButton<String>(
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF000000),
                                          ),
                                          menuMaxHeight: 150,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          dropdownColor: Colors.white,
                                          elevation: 0,
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                          ),
                                          items: const [
                                            DropdownMenuItem<String>(
                                              value: 'Prepaid',
                                              child: Text('Prepaid'),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'Postpaid',
                                              child: Text('Postpaid'),
                                            ),
                                          ],
                                          onChanged: (_value) {
                                            value = _value.toString();
                                            setState(
                                              () {
                                                value = _value.toString();
                                              },
                                            );
                                          },
                                          hint: const Text(
                                            'Select',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          alignment: Alignment.centerLeft,
                                          margin: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                          child: Text(
                                            "$value",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),

                                // trems & conditions...

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
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(width / 1.3, 50),
                                    backgroundColor: const Color(0xFFD6001B),
                                  ),
                                  onPressed: () {
                                    if (_formValue.currentState!.validate()) {
                                      if (isChecked) {
                                        if (value.isEmpty) {
                                          print('dambuss');
                                        } else {
//?
                                          sendRechargeData(
                                            _sugestionfieldController.text,
                                            _amount.text,
                                            isChecked.toString(),
                                            value,
                                            widget.name,
                                            widget.logo,
                                            getIp,
                                          );
//?
                                          setState(
                                            () {
                                              if (_pageState == 0) {
                                                _pageState = 1;
                                              }
                                            },
                                          );
                                          print("Okay");
                                        }
                                        print('Nice');
                                      } // this conditions for Terms and conditions ......
                                      else {
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
                                      //
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
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      _pageState = 0;
                    },
                  );
                },
                child: AnimatedContainer(
                  curve: Curves.linear,
                  duration: const Duration(
                    milliseconds: 0,
                  ),
                  color: Colors.white.withOpacity(_pinOpacity),
                  transform: Matrix4.translationValues(0, _pinYoffset, 0),
                  child: OtpScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
