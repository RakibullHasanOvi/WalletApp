import 'package:flutter/material.dart';

class CheakBoxWidgets extends StatefulWidget {
  // const CheakBoxWidgets({super.key});

  @override
  State<CheakBoxWidgets> createState() => _CheakBoxWidgetsState();
}

class _CheakBoxWidgetsState extends State<CheakBoxWidgets> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.black;
      }
      return Colors.black;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(
          () {
            isChecked = value!;
          },
        );
      },
    );
  }
}
