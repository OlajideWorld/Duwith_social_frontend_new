import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';

import '../../../common/custom-text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                child: Column(
                  children: [
                    CText(
                      text: "DUWITH SOCIAL",
                      size: 15,
                      fontFamily: UsedFonts.stalinistOne,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
