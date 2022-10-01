import 'package:flutter/material.dart';
import 'package:wallets_app/models/pages/bank_details.dart';

import '../Bank.dart';

class BankingItems extends StatelessWidget {
  // const MobileBankingItems({Key? key}) : super(key: key);
  final bankList = Bank.samples();
// MobileBankingItems(this.mbList);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: bankList.length,
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
                  builder: (context) => BankFormPage(bankList[index]),
                  // bankList[index]
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(bankList[index].imgUrl),
                ),
              ),
              // child: AssetImage(assetName),
            ),
          );
        });
  }
}
