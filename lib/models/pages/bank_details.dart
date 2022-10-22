import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:wallets_app/Pages/WelcomePage.dart';
import 'package:wallets_app/models/Bank.dart';

import '../../Pages/Screen/notification.dart';
import '../../Pages/Screen/otp_screen.dart';
// import '../../Pages/Screen/payment_confirm.dart';
import '../../Pages/widgets/check_box.dart';

class BankFormPage extends StatefulWidget {
  // const BankFormPage({Key? key}) : super(key: key);
  final Bank bankList;
  BankFormPage(this.bankList);

  @override
  State<BankFormPage> createState() => _BankFormPageState();
}

class _BankFormPageState extends State<BankFormPage> {
  //
  final _formValue = GlobalKey<FormState>();
  //Otp screens values....
  double _pinYoffset = 0;
  double _pinOpacity = 1;
  int _pageState = 0;
  var _backGroundColor = Color(0xFFF4F8FB);
  double windowWidth = 0;
  double windowHeight = 0;

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    //Using switch fuctions for Screen opacity....
    switch (_pageState) {
      case 0:
        _pinYoffset = windowHeight;
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
      top: false,
      child: Scaffold(
        backgroundColor: _backGroundColor,
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
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                // children: [
                child: Container(
                  margin: EdgeInsets.only(
                    top: 50,
                  ),
                  child: Center(
                    child: Form(
                      key: _formValue,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                margin: EdgeInsets.only(
                                  left: 30,
                                ),
                                child: FloatingActionButton(
                                  splashColor: Color(0xFFD6001B),
                                  // backgroundColor: Colors.black,
                                  backgroundColor: Color(0xFFF4F8FB),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_outlined,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SvgPicture.asset("images/tk.svg"),
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
                            height: 40,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 45),
                                height: 70,
                                width: 70,
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
                                  padding: EdgeInsets.all(5.0),
                                  child: Image.asset(
                                    widget.bankList.imgUrl,
                                    // height: 20,

                                    // "assets/bKash_logo.png",

                                    // height: 20,
                                    // width: 20,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Text(
                                  "Bank",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 48,
                              bottom: 10,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Bank Name',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            // height: 48,
                            margin: EdgeInsets.only(
                              left: 48,
                              right: 48,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                              },
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.4,
                                  horizontal: 13,
                                ),
                                fillColor: Color(0xFFEFF0F1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                hintText: widget.bankList.label,
                                hintStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 48,
                              bottom: 10,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Account Number',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            // height: 48,
                            margin: EdgeInsets.only(
                              left: 48,
                              right: 48,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some number';
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.4,
                                  horizontal: 13,
                                ),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                hintText: "Enter Account Number",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 48,
                              bottom: 10,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Account Name',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            // height: 48,
                            margin: EdgeInsets.only(
                              left: 48,
                              right: 48,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                              },
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.4,
                                  horizontal: 13,
                                ),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                hintText: "Enter Account Name",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 48,
                              bottom: 10,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Branch Name',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Container(
                            // height: 48,
                            margin: EdgeInsets.only(
                              left: 48,
                              right: 48,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                              },
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.4,
                                  horizontal: 13,
                                ),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                hintText: "Enter Branch Name",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 48,
                              bottom: 10,
                            ),
                            alignment: Alignment.centerLeft,
                            // child: Text(
                            //   'Bank Name',
                            //   style: TextStyle(
                            //     fontSize: 15,
                            //   ),
                            // ),
                          ),
                          Container(
                            // height: 48,
                            margin: EdgeInsets.only(
                              left: 48,
                              right: 48,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some number';
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.4,
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
                            ),
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
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Terms & Conditions"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 80,
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
                                      // _pageState = 1;
                                      if (_pageState != 1) {
                                        _pageState = 1;
                                      }
                                    },
                                  );
                                }
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // setState(
                  //   () {
                  //     _pageState = 0;
                  //     // if (_pageState != 1) {
                  //     //   _pageState = 1;
                  //     // } else {
                  //     //   _pageState = 0;
                  //     // }
                  //     // print('Click MotherF**ker');
                  //   },
                  // );
                },
                child: AnimatedContainer(
                  curve: Curves.linear,
                  duration: Duration(
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
