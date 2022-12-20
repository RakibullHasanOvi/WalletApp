import 'package:flutter/material.dart';

class CwidgetsTwo extends StatelessWidget {
  Function()? onTap;
  final image;
  final String label;
  CwidgetsTwo(
      {Key? key, required this.onTap, required this.image, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        left: 30,
        right: 30,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                // spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    image,
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
