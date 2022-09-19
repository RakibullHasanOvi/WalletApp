// import 'package:flutter/material.dart';
// import 'package:wallets_app/models/MobileBanking.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// import '../Screen/MB_screen.dart';

// class SGV extends StatelessWidget {
//   @override
//   final MobileBankingList = MobileBanking.generateItem();
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(30),
//       child: StaggeredGridView.countBuilder(
//         shrinkWrap: true,
//         physics: ScrollPhysics(),
//         itemCount: MobileBankingList.length,
//         crossAxisSpacing: 16,
//         mainAxisSpacing: 16,
//         crossAxisCount: 4,
//         itemBuilder: (contex, index) =>
//             MoblieBankingItems(MobileBankingList[index]),
//         staggeredTileBuilder: (_) => StaggeredTile.fit(3),
//       ),
//     );
//   }
// }
