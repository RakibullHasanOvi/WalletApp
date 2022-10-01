import 'package:flutter/material.dart';
import 'package:wallets_app/Pages/WelcomePage.dart';
import 'package:wallets_app/models/Bank.dart';

import '../../Pages/Screen/payment_confirm.dart';

class BankFormPage extends StatefulWidget {
  // const BankFormPage({Key? key}) : super(key: key);
  final Bank bankList;
  BankFormPage(this.bankList);

  @override
  State<BankFormPage> createState() => _BankFormPageState();
}

class _BankFormPageState extends State<BankFormPage> {
  @override
  Widget build(BuildContext context) {
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
            margin: EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ),
                );
              },
              child: Image(
                image: AssetImage(
                  'assets/Group 255.png',
                ),
              ),
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(
                right: 18,
              ),
              child: IconButton(
                iconSize: 10,
                icon: Image.asset(
                  'assets/Group 38.png',
                  height: 22,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          // children: [
          child: Container(
            margin: EdgeInsets.only(
              top: 60,
            ),
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
                    height: 40,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 45),
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          // image: DecorationImage(
                          //   image: AssetImage(
                          //     "assets/bKash_logo.png",
                          //   ),
                          // ),
                        ),
                        child: Image.asset(
                          widget.bankList.imgUrl,
                          // height: 20,

                          // "assets/bKash_logo.png",

                          // height: 20,
                          // width: 20,
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
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
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
                    height: 48,
                    margin: EdgeInsets.only(
                      left: 48,
                      right: 48,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        fillColor: Colors.indigo[50],
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
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
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
                    height: 48,
                    margin: EdgeInsets.only(
                      left: 48,
                      right: 48,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
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
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
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
                    height: 48,
                    margin: EdgeInsets.only(
                      left: 48,
                      right: 48,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
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
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
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
                    height: 48,
                    margin: EdgeInsets.only(
                      left: 48,
                      right: 48,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
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
                      top: 10,
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
                    height: 48,
                    margin: EdgeInsets.only(
                      left: 48,
                      right: 48,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
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
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(left: 55),
                          child: Image.asset('assets/Group 147.png'),
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
                        primary: Color.fromARGB(255, 237, 29, 14),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) {
                              return PaymentConfirm();
                            },
                          ),
                        );
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
    );
  }
}
