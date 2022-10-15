import 'package:flutter/material.dart';

class MinusOutPage extends StatelessWidget {
  const MinusOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: Container(
        child: Column(
          children: [
            //1st Row

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 10,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset('assets/bKash_logo.png'),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MOBILE BANKING',
                        style: TextStyle(
                          fontSize: 10,
                          letterSpacing: 2,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '01919972700',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '02-MONDAY',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      '5000.00 BDT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //2nd Row

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 10,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset('assets/Nagad_logo.png'),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MOBILE BANKING',
                        style: TextStyle(
                          fontSize: 10,
                          letterSpacing: 2,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '01717256199',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '02-MONDAY',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      '20000.00 BDT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),

            //3rd Row

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 10,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset('assets/bank_image/dbbl-new.png'),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BANK',
                        style: TextStyle(
                          fontSize: 10,
                          letterSpacing: 2,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '6456456465658565',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '02-MONDAY',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      '10000.00 BDT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //4th Row

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 10,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset('assets/m_recharge_image/gp.png'),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'RECHARGE',
                        style: TextStyle(
                          fontSize: 10,
                          letterSpacing: 2,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '01717256199',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '02-MONDAY',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      '500.00 BDT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
