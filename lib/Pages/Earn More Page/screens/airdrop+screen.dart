import "package:duwith_social/Pages/Earn%20More%20Page/components/airdrop_component.dart";
import "package:duwith_social/utils/color.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/sizes.dart";

class AirdropScreen extends StatelessWidget {
  const AirdropScreen({super.key});

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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: widthSize(20),
                      right: widthSize(20),
                      top: heightSize(30)),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: widthSize(5),
                              vertical: heightSize(5)),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEB102),
                            borderRadius: BorderRadius.circular(widthSize(10)),
                          ),
                          child: Text(
                            "Only Premuim Users Are Qualified For Airdrop Distribution",
                            style: GoogleFonts.poppins(
                              fontSize: widthSize(13),
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: heightSize(10)),
                        Text(
                          "Phase One",
                          style: GoogleFonts.poppins(
                            fontSize: widthSize(20),
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: heightSize(20)),
                        airdropPhaseOne(constraints.maxWidth),
                        SizedBox(height: heightSize(20)),
                        airdropGoalsandRewards(constraints.maxWidth),
                        SizedBox(height: heightSize(30)),
                        airdropStatus(context, constraints.maxWidth),
                        SizedBox(height: heightSize(30)),
                        airdropSurfingButton(context, constraints.maxWidth)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
