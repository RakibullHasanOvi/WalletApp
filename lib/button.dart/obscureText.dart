import 'package:flutter/material.dart';

class IcnButton extends StatefulWidget {
  const IcnButton({super.key});

  @override
  State<IcnButton> createState() => _IcnButtonState();
}

class _IcnButtonState extends State<IcnButton> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      icon: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
      ),
      color: Colors.black,
    );
  }
}
