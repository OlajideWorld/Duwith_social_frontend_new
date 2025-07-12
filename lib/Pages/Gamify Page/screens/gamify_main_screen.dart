import 'package:duwith_social/Pages/Gamify%20Page/components/gamify_widget.dart';
import 'package:duwith_social/common/button-widget.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/custom-nav-bar.dart';

class GamifyMainPage extends StatelessWidget {
  const GamifyMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBarWidget(),
      backgroundColor: gamifybackgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: heightSize(100)),
                ),
                gamifyTopBannerWidget(context, constraints.maxWidth),
                SizedBox(height: heightSize(15)),
                Padding(
                  padding: EdgeInsets.only(left: widthSize(10)),
                  child: Text(
                    'Trending Games',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: fontSize(18),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: heightSize(10)),
                Padding(
                  padding: EdgeInsets.only(
                      left: widthSize(10), right: widthSize(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: heightSize(80),
                        width: widthSize(90),
                        child: Image.asset(
                          "assets/images/gamifyImage2.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: heightSize(80),
                        width: widthSize(90),
                        child: Image.asset(
                          "assets/images/gamifyImage2.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: heightSize(80),
                        width: widthSize(90),
                        child: Image.asset(
                          "assets/images/gamifyImage2.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: heightSize(80),
                        width: widthSize(90),
                        child: Image.asset(
                          "assets/images/gamifyImage2.png",
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: heightSize(15)),
                Padding(
                  padding: EdgeInsets.only(left: widthSize(10)),
                  child: Text(
                    'Futured Games',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: fontSize(18),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
