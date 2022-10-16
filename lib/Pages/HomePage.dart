import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallets_app/Pages/Screen/notification.dart';
import 'package:wallets_app/Pages/WelcomePage.dart';
import 'package:wallets_app/models/MobileBanking.dart';
import '../models/pages/bank_item.dart';
import '../models/pages/mobile_banking_items.dart';
import '../models/pages/recharge_item.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final itemList = MobileBanking.generateItem();
    TabController _tabController = TabController(
      vsync: this,
      length: 3,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F8FB),
        // backgroundColor: Color.fromARGB(255, 243, 253, 255),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 200,
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => WelcomePage(),
                    transitionDuration: Duration(seconds: 0),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );
              },
              child: SvgPicture.asset(
                "assets/wallet_logo.svg",
                // color: Colors.red,
              ),

              // child: Image.asset('assets/Group 255.png'),
            ),
          ),
          // title: Container(
          //   alignment: Alignment.centerLeft,
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => WelcomePage()),
          //       );
          //     },
          //     child: Image.asset('assets/Group 255.png'),
          //   ),
          // ),
          actions: [
            Container(
              padding: EdgeInsets.only(
                right: 4,
              ),
              child: IconButton(
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
                icon: SvgPicture.asset(
                  'images/Notification.svg',
                  height: 22,
                ),
                // icon: Image.asset(
                //   'assets/Group 38.png',
                //   height: 22,
                // ),
              ),
            ),
          ],
        ),
        body: Container(
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
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 16,
                  ),
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    controller: _tabController,
                    tabs: [
                      Tab(
                        child: Text(
                          'Mobile Banking',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Bank',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Mobile Recharge',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    // width: 2,
                    margin: EdgeInsets.all(32),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        MobileBankingItems(),
                        BankingItems(),
                        MobileRechargeItem(),
                      ],
                    ),
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
