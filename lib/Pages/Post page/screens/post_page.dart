import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';

import '../../../common/custom-nav-bar.dart';
import '../../../common/custom-text.dart';

class PostContentPage extends StatelessWidget {
  const PostContentPage({super.key});

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
              child: Stack(
                children: [
                  CText(
                    text: "Account",
                    size: 13,
                    color: Color(0xFFA3A2A2),
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w600,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomNavBarWidget(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
