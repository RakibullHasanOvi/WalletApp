import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangePinScreen extends StatelessWidget {
  const ChangePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F8FB),
        //Appar start..
        appBar: AppBar(
          elevation: 0.4,
          backgroundColor: Colors.white,
          leadingWidth: 200,
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
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/notification_2.svg',
                  height: 22,
                ),
              ),
            ),
          ],
        ),
        //Close AppBar......
        //
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Expanded(
                child: Container(
                  // alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    left: 18,
                    right: 18,
                    top: _height * 0.03,
                    bottom: _height * 0.03,
                  ),
                  height: MediaQuery.of(context).size.height * 0.84,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F8FB),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        // spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    // border: Border(
                    //   bottom: BorderSide(
                    //     width: 1.0,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                  ),
                  //
                  //
                  //
                  child: Column(
                    children: [
                      //Using (Padding , text , textstyle widgets..)
                      Padding(
                        padding: EdgeInsets.only(
                          top: _height * 0.02,
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                // alignment: Alignment.topRight,
                                child: Icon(Icons.arrow_back_ios_new),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Text(
                              'CHANGE PIN',
                              style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //End Using (Padding , text , textstyle widgets..)

                      Container(
                        margin: EdgeInsets.only(
                          top: _height * 0.06,
                          left: 30,
                          right: 30,
                        ),
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //

                              //Old Pin..

                              //
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 30,
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(12),
                                    border: OutlineInputBorder(
                                        // borderSide: BorderSide.none,
                                        ),
                                    label: Text('Current Pin'),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(238, 230, 241, 244),
                                    // hintText: 'Current Pin',
                                  ),
                                ),
                              ),
                              //

                              //New Pin..

                              //
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 30,
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(12),
                                    border: OutlineInputBorder(
                                        // borderSide: BorderSide.none,
                                        ),
                                    label: Text('New Pin'),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(238, 230, 241, 244),
                                    // hintText: 'New Pin',
                                  ),
                                ),
                              ),
                              //

                              //Confirm Pin..

                              //
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 30,
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hoverColor: Colors.black,
                                    contentPadding: EdgeInsets.all(12),
                                    border: OutlineInputBorder(
                                        // borderSide: BorderSide.none,
                                        ),
                                    label: Text('Confirm Pin'),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(238, 230, 241, 244),
                                    // hintText: 'Confirm Pin',
                                  ),
                                ),
                              ),
                              //
                              //
                              //
                              Container(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(_width / 1, 50),
                                    primary: const Color(0xFFD6001B),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'SEND',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
