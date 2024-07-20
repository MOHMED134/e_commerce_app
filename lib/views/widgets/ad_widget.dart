import 'package:flutter/material.dart';

class AdWidget extends StatelessWidget {
  final Color? backgroundcolor;
  const AdWidget({
    this.backgroundcolor
    ,super.key});

  @override
  Widget build(BuildContext context) {

    return  Container(
      width: 320,
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Image(
              image: AssetImage('assets/images/supmar.png'),
            ),
          ),
          SizedBox(

            width: 25,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Best Quality',
                style: TextStyle(
                    fontWeight: FontWeight.w900, fontSize: 25,color: Colors.white),
              ),
              Text(
                'Get Up To 40% OFF',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: backgroundcolor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.0,
              offset: Offset(0, 0),
              spreadRadius: 0.0,
            ),
          ]),
    );
  }
}