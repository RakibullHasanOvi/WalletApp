import 'package:flutter/material.dart';
import 'package:wallets_app/Pages/Screen/widgets/In_Out.dart';

class MinusOutPage extends StatelessWidget {
  const MinusOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Column(
        children: [
//1st Row
          In_Out_detailes(
            image: Image.asset("assets/bKash_logo.png"),
            label: "MOBILE BANKING",
            number: "01919972700",
            label2: "02-MONDAY",
            ammount: "5000.00 BDT",
          ),

          //2nd Row
          In_Out_detailes(
            image: Image.asset("assets/Nagad_logo.png"),
            label: "MOBILE BANKING",
            number: "01919972700",
            label2: "02-MONDAY",
            ammount: "5000.00 BDT",
          ),
          //3rd Row
          In_Out_detailes(
            image: Image.asset("assets/bank_image/dbbl-new.png"),
            label: "BANK",
            number: "5446372283637933",
            label2: "02-MONDAY",
            ammount: "50000.00 BDT",
          ),

          //4th Row
          In_Out_detailes(
            image: Image.asset("assets/m_recharge_image/gp.png"),
            label: "MOBILE RECHARGE",
            number: "01734536743",
            label2: "02-MONDAY",
            ammount: "500.00 BDT",
          ),
        ],
      ),
    );
  }
}
