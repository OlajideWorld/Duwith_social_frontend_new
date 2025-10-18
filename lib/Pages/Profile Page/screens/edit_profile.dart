// ignore_for_file: must_be_immutable, unused_import

import 'package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart';
import 'package:duwith_social/Pages/Profile%20Page/components/edit_myprofile_widget.dart';
import 'package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../../../common/custom-text.dart';
import '../../../common/text-field.dart';

ProfileController profileController = ProfileController.instance;

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController username = TextEditingController(
      text: profileController.viewProfileData.value.username);

  TextEditingController useruniqueId = TextEditingController(
      text: profileController.viewProfileData.value.useruniqueId);

  TextEditingController bio =
      TextEditingController(text: profileController.viewProfileData.value.bio);

  TextEditingController phoneNumber = TextEditingController(
      text: profileController.viewProfileData.value.phoneNumber);

  TextEditingController email = TextEditingController(
      text: profileController.viewProfileData.value.email);

  TextEditingController gender = TextEditingController(
      text: profileController.viewProfileData.value.gender);

  @override
  void dispose() {
    super.dispose();
    username.dispose();
    useruniqueId.dispose();
    bio.dispose();
    phoneNumber.dispose();
    email.dispose();
    gender.dispose();
  }

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
                child: Obx(() {
                  return LoadingOverlayPro(
                    isLoading: profileController.profileLoading.value,
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          editProfileAppBar(context),
                          SizedBox(height: heightSize(5)),
                          Container(
                              padding: EdgeInsets.only(
                                  top: heightSize(22),
                                  left: widthSize(18),
                                  right: widthSize(17)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const PickImageWidget(),
                                  SizedBox(height: heightSize(10)),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: CText(
                                      text: "Personal Information",
                                      size: 15,
                                      color: Color(0xFF9D9C9C),
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: heightSize(15)),
                                  profileParameters(
                                    name: "Username",
                                    parsedValue: username,
                                    onChanged: (val) {
                                      profileController.usernameStored.value =
                                          val!;
                                    },
                                  ),
                                  SizedBox(height: heightSize(15)),
                                  profileParameters(
                                    name: "UniqueId",
                                    parsedValue: useruniqueId,
                                    onChanged: (val) {
                                      profileController
                                          .useruniqueIdStored.value = val!;
                                    },
                                  ),
                                  SizedBox(height: heightSize(15)),
                                  profileParameters(
                                    name: "Bio",
                                    parsedValue: bio,
                                    onChanged: (val) {
                                      profileController.bioStored.value = val!;
                                    },
                                  ),
                                  SizedBox(height: heightSize(15)),
                                  PickDateWidget(width: constraints.maxWidth),
                                  SizedBox(height: heightSize(15)),
                                  profileParameters(
                                    name: "Email",
                                    parsedValue: email,
                                    onChanged: (val) {
                                      profileController.emailStored.value =
                                          val!;
                                    },
                                  ),
                                  SizedBox(height: heightSize(15)),
                                  profileParameters(
                                    name: "Gender",
                                    parsedValue: gender,
                                    onChanged: (val) {
                                      profileController.genderStored.value =
                                          val!;
                                    },
                                  ),
                                  SizedBox(height: heightSize(15)),
                                  profileParameters(
                                    name: "Phone Number",
                                    parsedValue: phoneNumber,
                                    onChanged: (val) {
                                      profileController
                                          .phoneNumberStored.value = val!;
                                    },
                                  ),
                                  SizedBox(height: heightSize(38)),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: CText(
                                      text: "Pick some of your Interests",
                                      size: 13,
                                      color: Color(0xFF939393),
                                      fontFamily: UsedFonts.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: heightSize(20)),
                                  SizedBox(
                                    height: heightSize(150),
                                    child: Wrap(
                                      spacing: widthSize(6),
                                      runSpacing: heightSize(8),
                                      children: [
                                        SelectProfileTags(name: "Nature"),
                                        SelectProfileTags(name: "Travels"),
                                        SelectProfileTags(
                                            name: "Pest & Animals"),
                                        SelectProfileTags(name: "Events"),
                                        SelectProfileTags(name: "Quotes"),
                                        SelectProfileTags(name: "Books"),
                                        SelectProfileTags(name: "Music"),
                                        SelectProfileTags(name: "Tech"),
                                        SelectProfileTags(name: "Gadgets"),
                                        SelectProfileTags(name: "Fitness"),
                                        SelectProfileTags(name: "Adventures"),
                                        SelectProfileTags(name: "Food"),
                                        SelectProfileTags(name: "Fashion"),
                                        SelectProfileTags(name: "Tech"),
                                        SelectProfileTags(name: "Lifestyles"),
                                        SelectProfileTags(name: "Arts")
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: heightSize(40),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }

  profileParameters(
      {required String name,
      required TextEditingController parsedValue,
      required Function(String?)? onChanged}) {
    return Container(
      height: heightSize(70),
      padding: EdgeInsets.symmetric(
          vertical: heightSize(10), horizontal: widthSize(10)),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: textColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: widthSize(13),
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFB4B4B4),
                  fontSize: fontSize(14)),
              maxLines: 5,
              onChanged: onChanged,
              controller: parsedValue,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "Enter $name",
                hintStyle: const TextStyle(color: Color(0xFF918F99)),
                filled: true,
                fillColor: backgroundColor,
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: backgroundColor,
                    ),
                    borderRadius: BorderRadius.circular(16)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: backgroundColor,
                    ),
                    borderRadius: BorderRadius.circular(16)),
                contentPadding: EdgeInsets.only(
                    left: widthSize(10),
                    top: heightSize(5),
                    right: widthSize(5),
                    bottom: heightSize(5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
