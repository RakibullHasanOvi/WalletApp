import 'package:flutter/material.dart';
import 'package:wallets_app/models/m_recharge.dart';
import 'package:wallets_app/models/pages/rechrage_detailes.dart';

class MobileRechargeItem extends StatelessWidget {
  final rechargeList = MobileRecharge.items();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: rechargeList.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => RechargeFormPage(
                    rechargeList[index],
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
                  image: AssetImage(rechargeList[index].imgUrl),
                ),
              ),
              // child: AssetImage(assetName),
            ),
          );
        });
  }
}
