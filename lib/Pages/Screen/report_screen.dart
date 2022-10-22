import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallets_app/Pages/HomePage.dart';
import 'package:wallets_app/Pages/Screen/+in_page.dart';
import 'package:wallets_app/Pages/Screen/-out_page%20.dart';
import 'package:wallets_app/Pages/Screen/buttom_navigation.dart';

import '../WelcomePage.dart';
import 'notification.dart';
// import 'package:wallet_app/Pages/Screen/+in_page.dart';
// import 'package:wallet_app/Pages/Screen/-out_page.dart';
// import 'package:wallet_app/Pages/WelcomePage.dart';
// import 'package:wallet_app/models/pages/mbdatailes.dart';
// import 'package:wallet_app/models/pages/mb_items.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F8FB),
        // backgroundColor: Colors.blue[50],
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
                //   MaterialPageRoute(builder: (context) => WelcomePage()),
                // );
              },
              child: SvgPicture.asset(
                "assets/wallet_logo.svg",
                // color: Colors.red,
              ),
            ),
          ),
          // title: Container(
          //   alignment: Alignment.centerLeft,
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Image(
          //       image: AssetImage('assets/Group 255.png'),
          //     ),
          //   ),
          // ),
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
        // body: Container(
        //   height: 40,
        //   width: 40,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(8),
        //     color: Colors.black,
        //   ),
        //   margin: EdgeInsets.only(
        //     top: 20,
        //     left: 20,
        //   ),
        // child:
        body: ListView(
          children: [
            Container(
              child: Row(
                children: [
                  //using back button
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.only(
                        left: 30,
                        top: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      // margin: EdgeInsets.only(
                      //   top: 7,
                      //   left: 7,
                      // ),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                        // size: 10,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => BottomNavigation(),
                          transitionDuration: Duration(seconds: 0),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 27),
                    child: Text(
                      'WEEKLY REPORT',
                      style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Container(
                color: Color(0xFFF8F8F8),
                alignment: Alignment.topLeft,
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.red,
                  controller: _tabController,
                  tabs: [
                    Container(
                      margin: EdgeInsets.only(
                        right: 30,
                      ),
                      child: Tab(
                        child: Text(
                          '+ IN',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Tab(
                      child: Text(
                        '- OUT',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Container(
                height: 470,
                width: 200,
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,

                color: Color(0xFFF8F8F8),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Tab(
                      child: PlusInPage(),
                    ),
                    Tab(
                      child: MinusOutPage(),
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
