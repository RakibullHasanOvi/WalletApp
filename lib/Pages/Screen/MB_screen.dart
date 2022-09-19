import 'package:flutter/material.dart';

import '../../models/MobileBanking.dart';

class MoblieBankingItems extends StatelessWidget {
  final MobileBanking mobileBanking;
  const MoblieBankingItems(this.mobileBanking);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.bottomLeft,
          height: mobileBanking.height,
          width: mobileBanking.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mobileBanking.imgUrl),
            ),
          ),
        ),
      ),
    );
  }
}
