// import 'package:flutter/material.dart';

// class IcnButton extends StatefulWidget {
//   const IcnButton({super.key});

//   @override
//   State<IcnButton> createState() => _IcnButtonState();
// }

// class _IcnButtonState extends State<IcnButton> {
//   bool _obscureText = true;
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         setState(() {
//           _obscureText = !_obscureText;
//         });
//       },
//       icon: Icon(
//         _obscureText ? Icons.visibility_off : Icons.visibility,
//       ),
//       color: Colors.black,
//     );
//   }
// }
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';

class GetIpAddress extends StatefulWidget {
  const GetIpAddress({super.key});

  @override
  State<GetIpAddress> createState() => _GetIpAddressState();
}

class _GetIpAddressState extends State<GetIpAddress> {
  String textt = 'Ip';
  var getIp;
  callingIp() async {
    final getIp = await Ipify.ipv4();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(textt),
              TextButton(
                onPressed: () {
                  print(textt);
                },
                child: Text('getIp'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
