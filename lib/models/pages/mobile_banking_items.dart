import 'package:flutter/material.dart';
import 'package:wallets_app/models/pages/mbdetails.dart';
import 'package:wallets_app/models/services/all_get_api.dart';

class MobileBankingItems extends StatelessWidget {
  const MobileBankingItems({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //!Calling getURL..
      future: getmethod('http://54.226.160.184/user/mobile_bank/'),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            margin: EdgeInsets.only(top: 50),
            alignment: Alignment.topCenter,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          );
        } else {
          //! Using GridView Builder..
          return GridView.builder(
//Calling api lenght.
            itemCount: snapshot.data!.length,
            // shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, dynamic index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => MobileBankingFormPage(
                        name: api[index]['name'].toString(),
                        logo: "http://54.226.160.184" +
                            api[index]['logo'].toString(),
                        type: api[index]['type'].toString(),
                      ),
                      transitionDuration: Duration(milliseconds: 300),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(
                        "http://54.226.160.184" + api[index]['logo'].toString(),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
