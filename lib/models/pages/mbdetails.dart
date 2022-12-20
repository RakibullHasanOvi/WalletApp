import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallets_app/Pages/Screen/buttom_navigation.dart';
import 'package:wallets_app/Pages/Screen/notifiations/notification.dart';
import 'package:wallets_app/Pages/Screen/otp_screen.dart';
import 'package:wallets_app/models/services/all_get_api.dart';
import 'package:wallets_app/models/services/create_form.dart';
import 'package:wallets_app/models/services/typeAhed.dart';
import 'package:http/http.dart' as http;

class MobileBankingFormPage extends StatefulWidget {
//!Calling mobile_banking item..
  final String name, logo, type;
  const MobileBankingFormPage(
      {Key? key, required this.name, required this.logo, required this.type})
      : super(key: key);

  @override
  State<MobileBankingFormPage> createState() => _MobileBankingFormPageState();
}

class _MobileBankingFormPageState extends State<MobileBankingFormPage> {
  final storge = const FlutterSecureStorage();
//? Set Controller..
  final _sugestionfieldController = TextEditingController();
  final _amount = TextEditingController();
  String value = '';
  bool isChecked = false;

//?

//!
  Future<void> sendData(
      number, amount, is_trem, choise, mbName, addLogo) async {
    Map<String, String> data = {
      "phone_number": number,
      "amount": amount,
      "is_term": is_trem,
      "choice": choise,
      "bank_name": mbName,
      "add_logo": addLogo,
    };
    var showToken = await storge.read(key: 'token');
    var responce =
        await http.post(Uri.parse('http://zune360.com/request/mobilebanking/'),
            headers: {
              HttpHeaders.authorizationHeader: "token $showToken",
            },
            body: data);
    if (responce.statusCode == 200) {
      print(data);
    } else {
      print('not Ok');
    }
  }

//!

  final _formValue = GlobalKey<FormState>();
  // String dropdownValue = list.first;
  int _pagestate = 0;
  var _backGroundColor = const Color(0xFFF4F8FB);

  double pinYoffset = 0;
  double windowWidth = 0;
  double windowHeight = 0;
  double _pinOpaity = 1;

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // bool isSearching = searchController.text.isEmpty;
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

    // Set height width (MediaQuery)
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    //Using switch Function....
    switch (_pagestate) {
      case 0:
        _backGroundColor = _backGroundColor;
        pinYoffset = windowHeight;
        _pinOpaity = 1;

        break;

      //
      //
      case 1:
        _backGroundColor = _backGroundColor;
        pinYoffset = 0;
        _pinOpaity = 0.97;
        //
        //

        break;
    }
    // print('hola bitchola');
    // var getSuggestions;
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
              onTap: () {},
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
                      transitionDuration: const Duration(milliseconds: 100),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                },
              ),
            ),
          ],
        ),

//? Using Stack widget....(It is showing a PinScreen page....When click send button....)
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            // _fetchContacts();
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
                        //Using form...
                        child: Form(
                          key: _formValue, //form for key...
                          child: Column(
                            children: [
                              //
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

                              //Start of blance image...
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('images/tk.svg'),
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
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
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
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          widget.logo,
                                        ),
                                      ),
                                    ),
                                    // child: Image.network(
                                    //   widget.logo,
                                    // ),
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
                                height: 20,
                              ),

//! Search the saved numbers...
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 50,
                                    ),
                                    child: TAfeild(
                                        sugestionfieldController:
                                            _sugestionfieldController),
                                  ),
                                ],
                              ),

                              //2nd TextField usign paddig...
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 50,
                                ),
                                // height: 40,
                                child: CreateFormFeild(
                                  hint: widget.name,
                                  kytype: TextInputType.number,
                                  controller: _sugestionfieldController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your number';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              //3rd TextField using padding....

                              Container(
                                margin: const EdgeInsets.symmetric(
                                  // vertical: 2,
                                  horizontal: 50,
                                ),

                                // height: 40,
                                child: CreateFormFeild(
                                  hint: 'Amount',
                                  kytype: TextInputType.number,
                                  controller: _amount,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your amount';
                                    }
                                  },
                                ),
                              ),

//! Select Dropdown menu......
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
                                        borderRadius: BorderRadius.circular(15),
                                        dropdownColor: Colors.white,
                                        elevation: 0,
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                        ),
                                        items: const [
                                          DropdownMenuItem<String>(
                                            value: 'Personal',
                                            child: Text('Personal'),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: 'Agent',
                                            child: Text('Agent'),
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
                                          value,
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

//? trems & conditions...
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
                              Container(
                                margin: const EdgeInsets.only(
                                  bottom: 20,
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(290, 50),
                                    primary: const Color(0xFFD6001B),
                                  ),
                                  onPressed: () {
//! this conditions for form valitions....
                                    if (_formValue.currentState!.validate()) {
                                      if (isChecked) {
//?Mobile Recharge data send to server...
                                        sendData(
                                          _sugestionfieldController.text,
                                          _amount.text,
                                          isChecked.toString(),
                                          value,
                                          widget.name,
                                          widget.logo,
                                        );
//?
//!Page change ..
                                        setState(
                                          () {
                                            if (_pagestate == 0) {
                                              _pagestate = 1;
                                            }
                                          },
                                        );
                                        print("Okay");

                                        if (value.isEmpty) {
                                          print('dambuss');
                                        }
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
                                                // color: Colors.green,
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
                                                        Navigator
                                                            .pushReplacement(
                                                          context,
                                                          PageRouteBuilder(
                                                            pageBuilder: (context,
                                                                animation,
                                                                secondaryAnimation) {
                                                              return const BottomNavigation();
                                                            },
                                                          ),
                                                        );
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
                    milliseconds: 200,
                  ),
                  curve: Curves.easeInOutExpo,
                  transform: Matrix4.translationValues(0, pinYoffset, 0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(_pinOpaity),
                  ),
//?PinScreen Widgest.....
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
