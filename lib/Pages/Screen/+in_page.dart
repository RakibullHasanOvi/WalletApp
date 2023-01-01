import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallets_app/Pages/Screen/widgets/In_Out.dart';

class PlusInPage extends StatelessWidget {
  const PlusInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: Column(
        children: [
          In_Out_detailes(
            image: SvgPicture.asset("images/tk.svg"),
            label: "FUND ADD",
            number: "1464465464664",
            label2: "02-MONDAY",
            ammount: "50000.00 BDT",
          ),
          In_Out_detailes(
            image: SvgPicture.asset("images/tk.svg"),
            label: "FUND ADD",
            number: "1464465464664",
            label2: "02-MONDAY",
            ammount: "50000.00 BDT",
          ),
        ],
      ),
    );
  }
}
