import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class In_Out_detailes extends StatelessWidget {
  final image;
  final String label, label2, ammount;
  final dynamic number;

  const In_Out_detailes({
    Key? key,
    required this.image,
    required this.label,
    required this.number,
    required this.label2,
    required this.ammount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          margin: const EdgeInsets.only(
            top: 20,
            left: 5,
          ),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: image,
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        Container(
          margin: EdgeInsets.only(
            top: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                number,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                label2,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 25.w,
        ),
        Flexible(
          child: Container(
            child: Text(
              ammount,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
