// ignore_for_file: invalid_use_of_protected_member

import "package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart";
import "package:duwith_social/Pages/Earn%20More%20Page/controller/earn_controller.dart";
import "package:duwith_social/Pages/Earn%20More%20Page/screens/task_details.dart";
import "package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart";
import "package:duwith_social/common/button-widget.dart";
import "package:duwith_social/common/getxmessage.dart";
import "package:duwith_social/models/social_task_model.dart";
import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:google_mobile_ads/google_mobile_ads.dart";
import "package:startapp_sdk/startapp.dart";

import "../../../common/custom-text.dart";
import "../../Auth Page/services/socket_sevice.dart";

HomeController homeController = HomeController.instance;
EarnController earnController = EarnController.instance;
SocketService socketService = SocketService.instance;
AuthController authController = AuthController.instance;

showsocialMediaActivity(BuildContext context, double width) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: heightSize(500),
          padding: EdgeInsets.only(
              top: heightSize(15), left: widthSize(20), right: widthSize(20)),
          decoration: BoxDecoration(
            color: const Color(0xFF151B2E),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widthSize(15)),
                topRight: Radius.circular(widthSize(15))),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            ),
          ),
        );
      });
}

socialWidget(BuildContext context, double width, String image, String name,
    VoidCallback ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: heightSize(65),
      width: width,
      padding: EdgeInsets.symmetric(
          horizontal: widthSize(15), vertical: heightSize(14)),
      decoration: BoxDecoration(
          color: const Color(0xFF1A2137),
          borderRadius: BorderRadius.all(Radius.circular(widthSize(10)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: widthSize(260),
            child: Row(
              children: [
                Container(
                  height: heightSize(36),
                  width: widthSize(36),
                  decoration: BoxDecoration(
                      color: const Color(0xFF343232),
                      borderRadius:
                          BorderRadius.all(Radius.circular(widthSize(19.5)))),
                  child: Padding(
                    padding: EdgeInsets.all(widthSize(9)),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: widthSize(10)),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CText(
                        text: name,
                        size: 13,
                        color: const Color(0xFFE9E9E9),
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w500,
                      ),
                      Row(
                        children: [
                          const CText(
                            text: "Get 10,000 ",
                            size: 10,
                            color: textColor3,
                            fontFamily: UsedFonts.poppins,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: heightSize(12),
                            width: widthSize(12),
                            child: Image.asset(
                              "assets/images/points.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          buttonsWidget(context, heightSize(28), widthSize(61), "claim",
              const Color(0xFF0AA92D), 12, () {}, false, Colors.white)
        ],
      ),
    ),
  );
}

socialWidgetListTask(BuildContext context, double width, String name,
    VoidCallback ontap, SocialModel socialModel) {
  return GestureDetector(
    onTap: socialModel.completedBy.contains(authController.userdata.value.id)
        ? () => getSuccessSnackBar("You have performed this task already")
        : ontap,
    child: Container(
      height: heightSize(80),
      width: width,
      padding: EdgeInsets.symmetric(
          horizontal: widthSize(15), vertical: heightSize(14)),
      decoration: BoxDecoration(
          color: const Color(0xFF1A2137),
          borderRadius: BorderRadius.all(Radius.circular(widthSize(10)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: widthSize(260),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/Earn/thunder2.png",
                  fit: BoxFit.fitHeight,
                  height: heightSize(35),
                  width: widthSize(35),
                ),
                SizedBox(width: widthSize(10)),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CText(
                        text: truncate("Follow us on $name", length: 23),
                        size: 13,
                        color: const Color(0xFFE9E9E9),
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w500,
                      ),
                      Text(
                        "• New",
                        style: GoogleFonts.poppins(
                          fontSize: widthSize(15),
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFFDC448),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     CText(
                      //       text: "Get ${socialModel.reward} ",
                      //       size: 10,
                      //       color: textColor3,
                      //       fontFamily: UsedFonts.poppins,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //     SizedBox(
                      //       height: heightSize(12),
                      //       width: widthSize(12),
                      //       child: Image.asset(
                      //         "assets/images/points.png",
                      //         fit: BoxFit.fitHeight,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          socialModel.completedBy.contains(authController.userdata.value.id)
              ? SizedBox(
                  height: heightSize(5),
                  width: widthSize(5),
                )
              : SizedBox(
                  child: Row(
                    children: [
                      Text(
                        "+${socialModel.reward}",
                        style: GoogleFonts.poppins(
                          fontSize: widthSize(15),
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                      SizedBox(width: widthSize(5)),
                      Image.asset(
                        "assets/images/points.png",
                        fit: BoxFit.fitWidth,
                        height: heightSize(23),
                        width: widthSize(23),
                      ),
                      SizedBox(width: widthSize(5)),
                      Icon(Icons.arrow_forward_ios,
                          color: textColor, size: heightSize(18)),
                    ],
                  ),
                )

          // socialModel.completedBy.contains(authController.userdata.value.id)
          //     ? Container(
          //         height: heightSize(28),
          //         width: widthSize(61),
          //         alignment: Alignment.center,
          //         decoration: BoxDecoration(
          //           color: mainColor,
          //           borderRadius: BorderRadius.all(
          //             Radius.circular(widthSize(20)),
          //           ),
          //         ),
          //         child: Icon(
          //           Icons.check_circle,
          //           size: heightSize(16),
          //           color: textColor,
          //         ),
          //       )
          //     : buttonsWidget(context, heightSize(28), widthSize(61), "claim",
          //         const Color(0xFF0AA92D), 12, ontap, false, Colors.white)
        ],
      ),
    ),
  );
}
