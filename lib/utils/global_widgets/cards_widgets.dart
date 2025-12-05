import 'package:flutter/material.dart';
import 'package:rebay/utils/font.dart';

Widget carddetails() {
  return Container(
    width: 340,
    height: 200,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF98AEFE), Color(0xFF365BDC)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Stack(
      children: [
        Positioned(
          top: 20,
          left: 20,
          child: Text(
            "Credit Card",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: AppFonts.secondaryFont,
            ),
          ),
        ),
        Positioned(
          bottom: 90,
          left: 20,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),

            child: Image.asset(
              'assets/purchasebar/Chip.png',
              width: 50,
              height: 50,
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          left: 20,
          child: Row(
            children: [
              Text(
                "ALICE EVE",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: AppFonts.thirdfont,
                ),
              ),
              SizedBox(width: 60),
              Text(
                "12/25",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: AppFonts.thirdfont,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Text(
            "XXXX XXXX XXXX 1234",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontFamily: AppFonts.secondaryFont,
            ),
          ),
        ),

        Positioned(
          top: 0,
          right: 0,
          child: Image.asset('assets/cardcorners/1.png'),
        ),

        Positioned(
          top: 50,
          right: 0,
          child: Image.asset('assets/cardcorners/2.png'),
        ),
      ],
    ),
  );
}
