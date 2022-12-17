import 'package:flutter/material.dart';
import 'package:wallets_app/models/pages/rechrage_detailes.dart';
import 'package:wallets_app/models/services/all_get_api.dart';

class MobileRechargeItem extends StatelessWidget {
  const MobileRechargeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //!Using Future Builder..
    return FutureBuilder(
      //!Calling getURL..
      future: getmethod('http://zune360.com/api/user/recharge/'),
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
              mainAxisSpacing: 21,
            ),
            itemBuilder: (context, dynamic index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => RechargeFormPage(
                        name: snapshot.data![index]['name'].toString(),
                        logo: getDomain() +
                            snapshot.data![index]['logo'].toString(),
                        type: snapshot.data![index]['type'].toString(),
                      ),
                      transitionDuration: const Duration(milliseconds: 300),
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
                        getDomain() + snapshot.data![index]['logo'].toString(),
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

//Model create....
// class Rmodel {
//   String name, logo, type;
//   Rmodel({
//     required this.name,
//     required this.logo,
//     required this.type,
//   });
// }
