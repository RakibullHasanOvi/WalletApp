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
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RechargeFormPage(rechargeList[index]),
                  // bankList[index]
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
