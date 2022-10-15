import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallets_app/Pages/Screen/otp_screen.dart';
import 'package:wallets_app/models/m_recharge.dart';

import '../../Pages/Screen/notification.dart';
import '../../Pages/Screen/payment_confirm.dart';
import '../../Pages/WelcomePage.dart';
import '../../Pages/widgets/check_box.dart';
import '../../Pages/widgets/dropdown_menu.dart';

// List<String> list = [
//   "Personal",
//   "Agent",
// ];

class RechargeFormPage extends StatefulWidget {
  // Call Model  (Mobile Recharge List) ..........

  final MobileRecharge _rechargeList;
  RechargeFormPage(this._rechargeList);

  @override
  State<RechargeFormPage> createState() => _RechargeFormPageState();
}

class _RechargeFormPageState extends State<RechargeFormPage> {
  // String dropdownValue = list.first;
  double _pinYoffset = 0;
  double _pinOpacity = 1;
  int _pageState = 0;
  var _backGroundColor = Color(0xFFF4F8FB);
  double width = 0;
  double height = 0;
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
        _pinYoffset = 0;
        _pinOpacity = 0.7;
        break;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F8FB),
        // backgroundColor: Color.fromARGB(255, 243, 253, 255),
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 150,
          leading: Container(
            margin: EdgeInsets.only(left: 10),
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
              padding: EdgeInsets.only(
                right: 4,
              ),
              child: IconButton(
                iconSize: 10,
                icon: SvgPicture.asset(
                  'images/Notification.svg',
                  height: 22,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => NotificationPage(),
                      transitionDuration: Duration(seconds: 0),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  // height: height,
                  // width: width,
                  child: Column(
                    // ?
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/tk.png'),
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
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
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
                                        widget._rechargeList.imgUrl,
                                        // height: 20,

                                        // "assets/bKash_logo.png",

                                        //   height: 20,
                                        //   width: 20,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Text(
                                      "Recharge",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 40,
                                margin: EdgeInsets.only(
                                  top: 30,
                                  left: 50,
                                  right: 50,
                                ),
                                // height: 60,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: .5,
                                    ),
                                    fillColor: Colors.white,
                                    prefixIcon: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        // height: 58,
                                        // width: 60,
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

                                    // icon: Container(
                                    //   height: 50,
                                    //   width: 50,

                                    //   decoration: BoxDecoration(
                                    //     color: Colors.blue,
                                    //     borderRadius: BorderRadius.circular(10),
                                    //   ),

                                    //   child: Image.asset(
                                    //     'assets/user-plus.png',
                                    //     color: Colors.white,
                                    //   ),

                                    //   Icon(
                                    //     Icons.add_call,

                                    //   ),
                                    // ),
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
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 30,
                                  left: 50,
                                  right: 50,
                                ),
                                child: Container(
                                  height: 45,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: .5,
                                        horizontal: 15,
                                      ),
                                      filled: true,
                                      hintText: widget._rechargeList.label,
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 20,
                                  left: 50,
                                  right: 50,
                                ),
                                child: Container(
                                  height: 45,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: .5,
                                        horizontal: 15,
                                      ),
                                      filled: true,
                                      hintText: "Amount",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                // decoration: BoxDecoration(
                                //   color: Colors.white,
                                //   borderRadius: BorderRadius.circular(20),

                                // ),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 50),
                                child: DropdownMenuWidget(),
                                // child: Container(
                                //   height: MediaQuery.of(context).size.width * .1,
                                //   width: MediaQuery.of(context).size.height * .2,
                                //   decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     borderRadius: BorderRadius.circular(10),
                                //   ),
                                //   child: DropdownButton(
                                //     borderRadius: BorderRadius.circular(20),
                                //     dropdownColor: Colors.white,
                                //     value: dropdownValue,
                                //     icon: Icon(Icons.arrow_downward),
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
                                //     hint: Text(
                                //       'Seleted',
                                //     ),
                                //     items: list.map<DropdownMenuItem<String>>(
                                //       (String value) {
                                //         return DropdownMenuItem(
                                //           value: value,
                                //           child: Text(value),
                                //         );
                                //       },
                                //     ).toList(),
                                //   ),
                                // ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.only(left: 45),
                                      child: CheakBoxWidgets(),
                                      // child: Image.asset('assets/Group 147.png'),
                                      // child: Icon(
                                      //   Icons.check_box,
                                      // ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Terms & Conditions"),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(width / 1.4, 50),
                                  primary: Color(0xFFD6001B),
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
                                  // Navigator.of(context).push(
                                  //   PageRouteBuilder(
                                  //     opaque: false, // set to false
                                  //     pageBuilder: (_, __, ___) => OtpScreen(),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //
            //
            //
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
                curve: Curves.linear,
                duration: Duration(
                  milliseconds: 1000,
                ),
                color: Colors.white.withOpacity(_pinOpacity),
                transform: Matrix4.translationValues(0, _pinYoffset, 0),
                child: OtpScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
