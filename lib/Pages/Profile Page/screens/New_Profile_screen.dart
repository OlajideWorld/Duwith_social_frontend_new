import "package:duwith_social/Pages/Profile%20Page/screens/customer_support_New.dart";
import "package:duwith_social/Pages/Profile%20Page/screens/edit_profile.dart";
import "package:duwith_social/Pages/Profile%20Page/screens/notifications.dart";
import "package:duwith_social/Pages/Profile%20Page/screens/socials_links.dart";
import "package:duwith_social/common/getxmessage.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../common/custom-nav-bar.dart";
import "../../../utils/color.dart";
import "../../../utils/sizes.dart";
import "../../Shop Page/components/shop_components.dart";
import "../../View Profile Page/components/profile_appBar.dart";
import "../components/new_profile_comp1.dart";
import "../components/social_binding_widget.dart";
import "../controller/profile_controller.dart";

// ignore: must_be_immutable
class NewProfileScreenPage extends StatelessWidget {
  NewProfileScreenPage({super.key});

  ProfileController profileController = ProfileController.instance;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: const CustomNavBarWidget(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Obx(() {
                return SafeArea(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: widthSize(20),
                          right: widthSize(20),
                          top: heightSize(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: heightSize(20)),
                          newProfileviewProfileData(
                              context, constraints.maxWidth),
                          SizedBox(height: heightSize(30)),
                          SizedBox(
                            height: heightSize(49),
                            width: constraints.maxWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                numbersWidget(
                                    profileController.engagementShortened(
                                        profileController.viewProfileData.value
                                            .followers.length),
                                    "Followers"),
                                numbersWidget(
                                    profileController.engagementShortened(
                                        profileController.viewProfileData.value
                                            .following.length),
                                    "Following"),
                                numbersWidget(
                                    profileController.engagementShortened(
                                        profileController
                                            .userPostList.value.length),
                                    "Posts"),
                                numbersWidget("0", "Visitors")
                              ],
                            ),
                          ),
                          SizedBox(height: heightSize(30)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "My Wallets",
                                style: GoogleFonts.poppins(
                                  fontSize: widthSize(20),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.help_outline,
                                color: textColor,
                                size: heightSize(20),
                              )
                            ],
                          ),
                          SizedBox(height: heightSize(20)),
                          shoptypeAdvert(
                              color1: const Color(0xFFE5AC45),
                              color2: const Color(0xFFB96400),
                              textColorUsed: const Color(0xFFFBE9CD),
                              type: "Box",
                              image: "assets/images/Shop/upgradebox.png",
                              context: context),
                          SizedBox(height: heightSize(30)),
                          newWalletProfileOption(() {
                            Get.to(() => SocialLinkBindingPage());
                          }, FontAwesomeIcons.userPlus, Colors.orange,
                              "Social Links"),
                          SizedBox(height: heightSize(50)),
                          newWalletProfileOption(
                              () => Get.to(() => const NotificationScreen()),
                              Icons.star,
                              Colors.purple,
                              "Notifications"),
                          SizedBox(height: heightSize(50)),
                          newWalletProfileOption(
                              () => getSuccessSnackBar("Coming Soon"),
                              Icons.verified_user,
                              Colors.deepOrange,
                              "Privacy Policy"),
                          SizedBox(height: heightSize(50)),
                          newWalletProfileOption(
                              () => getSuccessSnackBar("Coming Soon"),
                              Icons.star,
                              Colors.purple,
                              "Terms of Service"),
                          SizedBox(height: heightSize(50)),
                          newWalletProfileOption(() {
                            Get.to(() => EditProfileScreen());
                          }, Icons.folder, Colors.orange, "Edit My Profile"),
                          SizedBox(height: heightSize(50)),
                          newWalletProfileOption(
                              () => getSuccessSnackBar("Coming Soon"),
                              FontAwesomeIcons.store,
                              Colors.redAccent,
                              "Community Guidelines"),
                          SizedBox(height: heightSize(50)),
                          newWalletProfileOption(() {
                            Get.to(() => CustomerSupportPage());
                          }, Icons.info, Colors.green, "Customer Support"),
                          SizedBox(height: heightSize(50)),
                          newWalletProfileOption(
                              () => getSuccessSnackBar("Coming Soon"),
                              Icons.settings,
                              Colors.deepOrange,
                              "Settings"),
                          SizedBox(height: heightSize(50)),
                          newWalletProfileOption(() {}, Icons.block, Colors.red,
                              "Blocked Accounts"),
                          SizedBox(height: heightSize(50)),
                          newWalletProfileOption(
                              () => logoutDetails(
                                  context,
                                  "Delete this Account",
                                  "Are you sure you want to delete this account?",
                                  constraints.maxWidth,
                                  () {}),
                              Icons.delete,
                              Colors.red,
                              "Delete My Account"),
                          SizedBox(height: heightSize(50)),
                        ],
                      ),
                    ),
                  ),
                );
              }));
        },
      ),
    );
  }
}

newWalletProfileOption(
  Function() ontap,
  IconData iconUsed,
  Color colorUsed,
  String text,
) {
  return GestureDetector(
    onTap: ontap,
    child: SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Icon(
            iconUsed,
            size: heightSize(20),
            color: colorUsed,
          ),
          SizedBox(width: widthSize(20)),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: widthSize(20),
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
