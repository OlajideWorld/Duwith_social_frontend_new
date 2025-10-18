import "package:cached_network_image/cached_network_image.dart";
import "package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart";
import "package:duwith_social/Pages/Profile%20Page/screens/view_myprofile_screen.dart";
import "package:duwith_social/utils/color.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/sizes.dart";

AuthController authController = AuthController.instance;

newProfileviewProfileData(BuildContext context, double width) {
  return SizedBox(
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: widthSize(270),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: authController.userdata.value.profileImage,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                imageBuilder: (context, imageprovider) {
                  return Container(
                    height: heightSize(80),
                    width: widthSize(80),
                    decoration: const ShapeDecoration(
                        shape: OvalBorder(), color: Colors.black),
                    child: Container(
                      height: heightSize(70),
                      width: widthSize(70),
                      decoration: ShapeDecoration(
                          shape: const OvalBorder(),
                          image: DecorationImage(
                              image: imageprovider, fit: BoxFit.fill)),
                    ),
                  );
                },
              ),
              SizedBox(width: widthSize(20)),
              Padding(
                padding: EdgeInsets.only(top: heightSize(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      authController.userdata.value.username,
                      style: GoogleFonts.poppins(
                        fontSize: widthSize(20),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: heightSize(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "ID: ${truncate(authController.userdata.value.id, length: 10)}",
                          style: GoogleFonts.poppins(
                            fontSize: widthSize(15),
                            fontWeight: FontWeight.w500,
                            color: textColor3,
                          ),
                        ),
                        SizedBox(width: widthSize(10)),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                text: authController.userdata.value.id));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Copied to clipboard ✅")),
                            );
                          },
                          child: Icon(
                            Icons.copy,
                            color: textColor3,
                            size: heightSize(15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: widthSize(10))
                  ],
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Get.to(() => ViewUserProfileScreen(isyou: true)),
          child: Icon(
            Icons.arrow_forward_ios_sharp,
            color: textColor3,
            size: heightSize(25),
          ),
        )
      ],
    ),
  );
}
