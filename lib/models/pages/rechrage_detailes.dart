import 'package:flutter/material.dart';
import 'package:wallets_app/models/m_recharge.dart';

import '../../Pages/Screen/payment_confirm.dart';
import '../../Pages/WelcomePage.dart';

List<String> list = [
  "Personal",
  "Agent",
];

class RechargeFormPage extends StatefulWidget {
  final MobileRecharge _rechargeList;
  RechargeFormPage(this._rechargeList);

  @override
  State<RechargeFormPage> createState() => _RechargeFormPageState();
}

class _RechargeFormPageState extends State<RechargeFormPage> {
  String dropdownValue = list.first;
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
        body: ListView(
          // ?
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
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
                            widget._rechargeList.imgUrl,
                            // height: 20,

                            // "assets/bKash_logo.png",

                            //   height: 20,
                            //   width: 20,
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
                          fillColor: Colors.white,
                          prefixIcon: GestureDetector(
                            onTap: () {},
                            child: Container(
                              // height: 58,
                              // width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
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
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
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
                        height: 50,
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
                      margin: EdgeInsets.only(left: 55),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(20),
                        dropdownColor: Colors.white,
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        // elevation: 16,
                        // style: TextStyle(color: Colors.deepPurple),
                        // underline: Container(
                        //   height: 2,
                        //   color: Colors.deepPurpleAccent,
                        // ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
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
                    ElevatedButton(
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
