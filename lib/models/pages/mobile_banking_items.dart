import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallets_app/models/pages/mbdetails.dart';

import 'package:wallets_app/models/MobileBanking.dart';

class MobileBankingItems extends StatelessWidget {
  // const MobileBankingItems({Key? key}) : super(key: key);
  final itemList = MobileBanking.generateItem();
// MobileBankingItems(this.mbList);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemList.length,
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
                pageBuilder: (_, __, ___) => MobileBankingFormPage(
                  itemList[index],
                ),
                transitionDuration: Duration(milliseconds: 300),
                transitionsBuilder: (_, a, __, c) =>
                    FadeTransition(opacity: a, child: c),
              ),
            );
          },
          child: Container(
            // height: itemList[index].height,
            // width: itemList[index].width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              image: DecorationImage(
                // image: Svg(assetName),
                image: AssetImage(
                  itemList[index].imgUrl,
                ),
              ),
            ),
            // child: AssetImage(assetName),
          ),
        );
      },
    );
  }
}
