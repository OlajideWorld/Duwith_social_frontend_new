import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';

backgroundEcclipse(double width) {
  return SizedBox(
    height: heightSize(500),
    width: width,
    child: Stack(
      children: [
        Center(
          child: SizedBox(
            height: heightSize(250),
            child: Image.asset(
              "assets/images/Onboard/onboard6.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: heightSize(200), left: widthSize(350)),
          child: SizedBox(
            height: heightSize(150),
            child: Image.asset("assets/images/Onboard/onboard4.png"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: heightSize(200), right: widthSize(300)),
          child: SizedBox(
            height: heightSize(150),
            child: Image.asset("assets/images/Onboard/onboard5.png"),
          ),
        )
      ],
    ),
  );
}

backgroundImageOnboard() {
  return SizedBox(
    height: heightSize(380),
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: heightSize(185), right: widthSize(200)),
          child: SizedBox(
            height: heightSize(145),
            child: Image.asset(
              "assets/images/Onboard/onboard2.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Center(
          child: SizedBox(
            height: heightSize(350),
            width: widthSize(225),
            child: Image.asset(
              "assets/images/Onboard/onboard3.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: heightSize(290), left: widthSize(220)),
          child: SizedBox(
            height: heightSize(130),
            child: Image.asset(
              "assets/images/Onboard/onboard.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    ),
  );
}
