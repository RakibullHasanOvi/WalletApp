import 'package:flutter/material.dart';

import 'package:wallets_app/Pages/WelcomePage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(vsync: this, length: 3);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 253, 255),
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          title: Container(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              },
              child: Image(
                image: AssetImage('assets/Group 255.png'),
              ),
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(
                right: 18,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/Group 38.png',
                ),
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
                    ImageIcon(
                      AssetImage('assets/tk.png'),
                      size: 70,
                    ),
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
                  height: 80,
                ),
                Container(
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
                    margin: EdgeInsets.all(32),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => MoblieBankingItems(),
                        //       ),
                        // );
                        // },
                        // ),
                        Text(
                          'Click this items',
                        ),
                        Text(
                          'Monju',
                        ),
                        Text(
                          'King Of Bangladesh',
                        ),
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
