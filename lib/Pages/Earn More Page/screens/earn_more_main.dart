import 'package:duwith_social/common/custom-nav-bar.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../common/custom-text.dart';
import '../../../utils/sizes.dart';

class EarnMorePage extends StatelessWidget {
  const EarnMorePage({super.key});

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
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Positioned(
                            bottom: heightSize(270),
                            child: Opacity(
                              opacity: 0.3,
                              child: SizedBox(
                                height: heightSize(710),
                                width: constraints.maxWidth,
                                child: Image.asset("assets/images/album5.png"),
                              ),
                            ),
                          ),
                          CText(
                            text: "Account",
                            size: 13,
                            color: Color(0xFFA3A2A2),
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
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
