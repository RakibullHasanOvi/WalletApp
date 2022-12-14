import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:wallets_app/Pages/Screen/payment_confirm.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  // final _formValue = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white.withOpacity(0.7),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Security_pin.svg',
                  height: 150,
                ),
                Container(
                  padding: const EdgeInsets.all(50),
                  child: OTPTextField(
                    otpFieldStyle: OtpFieldStyle(
                      borderColor: const Color(0xFFD6D6D6),
                      // borderColor: Colors.white,
                      backgroundColor: const Color(0xFFD6D6D6),
                      focusBorderColor: Colors.grey,
                    ),
                    // outlineBorderRadius: ,
                    keyboardType: TextInputType.number,
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 45,
                    fieldStyle: FieldStyle.box,
                    // onChanged: (pin) {
                    //   print("Changed: " + pin);
                    // },
                    // onCompleted: (pin) {
                    //   print("Completed: " + pin);
                    // },
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width / 1.33, 60),
                      backgroundColor: const Color(0xFFD6001B),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (_, __, ___) => PaymentConfirm(),
                        ),
                      );
                    },
                    child: const Text(
                      "Send",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
