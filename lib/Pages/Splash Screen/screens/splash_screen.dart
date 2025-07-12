import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                    top: constraints.maxHeight * 0.4, bottom: heightSize(57)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DUWITH SOCIAL",
                      style: GoogleFonts.stalinistOne(
                        color: textColor,
                        fontSize: fontSize(18),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: heightSize(50),
                      width: widthSize(50),
                      child: LoadingIndicator(
                          indicatorType: Indicator.ballSpinFadeLoader,

                          /// Required, The loading type of the widget
                          colors: const [rotateColor],

                          /// Optional, The color collections
                          strokeWidth: widthSize(29),

                          /// Optional, The stroke of the line, only applicable to widget which contains line
                          backgroundColor: backgroundColor,

                          /// Optional, Background of the widget
                          pathBackgroundColor: Colors.black

                          /// Optional, the stroke backgroundColor
                          ),
                    )
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
