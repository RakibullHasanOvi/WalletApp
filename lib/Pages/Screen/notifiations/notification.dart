import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../models/services/all_get_api.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F8FB),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 200,
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
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/notification_2.svg',
                  height: 22,
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
//Row....
            Row(
              children: [
//GestureDetector for cliclable..
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: height * 0.05,
                      left: width * 0.05,
                    ),
                    height: height * 0.05,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                  width: width * 0.18,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: height * 0.05,
                  ),
                  child: const Text(
                    'NOTIFICATON',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            FutureBuilder(
//!Calling mobile banking items getURL..
              future: getmethod('http://zune360.com/request/mobilebanking/'),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    margin: const EdgeInsets.only(top: 50),
                    alignment: Alignment.topCenter,
                    child: const CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  );
                } else {
//! Using Listview Builder..
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, dynamic index) {
//? Define the date of time.
                      String _d = snapshot.data![index]["created_at"];
                      DateTime _datetime = DateTime.parse(_d);
                      // print('Thi sis -> $_datetime');
                      // DateTime _datetime = DateTime(year)
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                  left: width * 0.05,
                                ),
                                height: height * 0.06,
                                width: width * 0.12,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
//Add image...
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      snapshot.data![index]["add_logo"]
                                          .toString(),
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index]['bank_name']
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data![index]['phone_number']
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        // letterSpacing: 3,
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        DateFormat('dd-MMM-yyyy hh:mm a')
                                            .format(_datetime),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          // letterSpacing: 3,
                                        ),
                                      ),
                                    ),
                                    // snapshot.data![index]['created_at']
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                snapshot.data![index]['status'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  // letterSpacing: 3,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '\৳ ' +
                                    snapshot.data![index]['amount'].toString(),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  // letterSpacing: 3,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
