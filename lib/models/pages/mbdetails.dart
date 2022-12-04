import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:wallets_app/Pages/Screen/buttom_navigation.dart';
import 'package:wallets_app/Pages/Screen/notification.dart';
import 'package:wallets_app/Pages/Screen/otp_screen.dart';

//!List for  dropdown menu..
List<String> list = [
  "Personal",
  "Agent",
];
List<Myarr> persons = [];

class Myarr {
  dynamic name, number;
  Myarr(this.name, this.number);
  static List<Myarr> getSuggestions(String query) =>
      List.of(persons).where((user) {
        final userLower = user.name.toLowerCase();
        final queryLower = query.toLowerCase();
        final userNumber = user.number;
        final queryNumber = query;
        return userLower.contains(queryLower) ||
            userNumber.contains(queryNumber);
      }).toList();
}

var myarr = [];

class MobileBankingFormPage extends StatefulWidget {
//Calling mobile_banking item..
  final name, logo, type;
  const MobileBankingFormPage(
      {Key? key, required this.name, required this.logo, required this.type})
      : super(key: key);

  @override
  State<MobileBankingFormPage> createState() => _MobileBankingFormPageState();
}

class _MobileBankingFormPageState extends State<MobileBankingFormPage> {
  //
  //Contact list calling.
  List<Contact>? _contacts;
  bool _permissionDenied = false;
  //
  final _sugestionfieldController = TextEditingController();

  //
  String value = '';
  bool isChecked = false;
  final _formValue = GlobalKey<FormState>();
  String dropdownValue = list.first;
  int _pagestate = 0;
  var _backGroundColor = const Color(0xFFF4F8FB);

  double pinYoffset = 0;
  double windowWidth = 0;
  double windowHeight = 0;
  double _pinOpaity = 1;
  // Contect access in pjhone device
  // List<Contact> contacts = [];
  // List<Contact> contactsFiltered = [];
  TextEditingController searchController = TextEditingController();

  //
  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      setState(() => _contacts = contacts);
      for (var i = 0; i < _contacts!.length; i++) {
        // myarr.add(_contacts?[i].displayName);

        var num = _contacts?[i].phones;
        for (var j = 0; j < num!.length; j++) {
          persons.add(Myarr(_contacts?[i].displayName,
              num[j].number.replaceAll(RegExp('[^0-9]'), "")));
        }
      }
    }
  }

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

        // Using Stack widget....(It is showing a PinScreen page....When click send button....)
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
                                    margin: EdgeInsets.only(
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
                                    child: Padding(
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

                              //1st TextField's ccontainer...
                              Column(
                                children: [
//
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      // vertical: 10,
                                      horizontal: 50,
                                    ),
                                    child: TypeAheadField<Myarr>(
                                      minCharsForSuggestions: 2,
                                      textFieldConfiguration:
                                          TextFieldConfiguration(
                                        controller: _sugestionfieldController,
                                        onSubmitted: (Contact) {
                                          _sugestionfieldController.text =
                                              Contact;
                                        },
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        decoration: InputDecoration(
                                          // fillColor: Colors.white,
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Search Phonebook..',
                                          contentPadding: EdgeInsets.all(5),
                                          prefixIcon: GestureDetector(
                                            onTap: () {
                                              print('bukachondro');
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              // height: 30,
                                              width: 50,
                                              // margin:
                                              //     const EdgeInsets.only(right: 10),
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
                                          // focusedBorder: OutlineInputBorder(),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                      suggestionsCallback: (pattern) async {
                                        return await Myarr.getSuggestions(
                                            pattern);
                                      },
                                      itemBuilder: (context, suggestion) {
                                        return ListTile(
                                          leading: Icon(Icons.person),
                                          title: Text(suggestion.name),
                                          subtitle: Text(suggestion.number),
                                        );
                                      },
                                      onSuggestionSelected: (suggestion) {
                                        _sugestionfieldController.text =
                                            suggestion.number;
                                      },
                                    ),
                                  )
                                  // Text('This numbe is $_Number'),
                                ],
                              ),

                              //2nd TextField usign paddig...
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 50,
                                ),
                                // height: 40,
                                child: TextFormField(
                                  controller: _sugestionfieldController,
                                  // onChanged: (val) {
                                  //   setState(() {
                                  //     updateNumber();
                                  //   });
                                  // },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      // vertical: 10,
                                      horizontal: 13,
                                    ),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    // hintText: "$_Number",
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

                              //3rd TextField using padding....

                              Container(
                                margin: const EdgeInsets.symmetric(
                                  // vertical: 2,
                                  horizontal: 50,
                                ),

                                // height: 40,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 13,
                                    ),
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    hintText: "Amount",
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

                              // Select Dropdown menu......

                              Container(
                                margin: const EdgeInsets.only(
                                  left: 45,
                                ),
                                child: Container(
                                  // alignment: Alignment.centerLeft,
                                  // height: 40,
                                  // width: 150,
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(15),
                                  //   color: Color(0xFFFFFFFF),
                                  // ),
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
                                          items: [
                                            const DropdownMenuItem<String>(
                                              value: 'Personal',
                                              child: Text('Personal'),
                                            ),
                                            const DropdownMenuItem<String>(
                                              value: 'Agent',
                                              child: Text('Agent'),
                                            ),
                                          ],
                                          onChanged: (_value) {
                                            value = _value.toString();
                                            // if (_value!.isEmpty) {
                                            //   print('dambuss');
                                            // } else {
                                            setState(
                                              () {
                                                value = _value.toString();
                                              },
                                            );
                                          },
                                          hint: Container(
                                            // alignment: Alignment.centerLeft,
                                            // height: MediaQuery.of(context).size.width * 1,
                                            // width: MediaQuery.of(context).size.height * .2,
                                            // decoration: BoxDecoration(
                                            //   borderRadius: BorderRadius.circular(10),
                                            //   color: Colors.white,
                                            // ),
                                            // height: 90,
                                            // width: 150,
                                            // decoration: BoxDecoration(
                                            //   borderRadius: BorderRadius.circular(15),
                                            //   color: Colors.white,
                                            // ),
                                            child: const Text(
                                              'Select',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF000000),
                                              ),
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
                                            // textAlign: TextAlign.start,
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
                                  bottom: 20,
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(290, 50),
                                    primary: const Color(0xFFD6001B),
                                  ),
                                  onPressed: () {
                                    // this conditions for form valitions....
                                    if (_formValue.currentState!.validate()) {
                                      if (isChecked) {
                                        if (value.isEmpty) {
                                          print('dambuss');
                                        } else {
                                          setState(
                                            () {
                                              // _pagestate = 1;
                                              if (_pagestate == 0) {
                                                _pagestate = 1;
                                              }
                                              // else {
                                              //   _pagestate = 0;
                                              // }
                                            },
                                          );
                                          print("Okay");
                                        }
                                        print('Nice');
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
                    milliseconds: 200,
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
    );
  }
}
