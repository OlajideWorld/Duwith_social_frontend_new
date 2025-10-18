// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import "dart:io";

import "package:cached_network_image/cached_network_image.dart";
import "package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart";
import "package:duwith_social/Pages/Profile%20Page/components/profile_list_widget.dart";
import "package:duwith_social/Pages/Profile%20Page/controller/profile_controller.dart";
import "package:duwith_social/common/button-widget.dart";
import "package:duwith_social/utils/color.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:image_picker/image_picker.dart";

import "../../../common/custom-text.dart";
import "../../../common/getxmessage.dart";
import "../../../utils/sizes.dart";

ProfileController profileController = ProfileController.instance;
SocketService socketService = SocketService.instance;

editProfileAppBar(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(color: Color(0xFF151B2E)),
    padding: EdgeInsets.only(
        top: heightSize(30),
        left: widthSize(20),
        right: widthSize(20),
        bottom: heightSize(25)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        backbutton(onTap: () => Get.back()),
        const CText(
          text: "Edit Profile",
          size: 15,
          color: Color(0xFFA3A2A2),
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w500,
        ),
        buttonsWidget(
            context, heightSize(30), widthSize(77), "Save", mainColor, 13,
            () async {
          profileController.profileLoading.value = true;

          if (profileController.savedImage.value != "") {
            await profileController.uploadImage(profileController.image!);
          }

          final profiledata = {
            "username": profileController.usernameStored.value == ""
                ? profileController.viewProfileData.value.username
                : profileController.usernameStored.value,
            "useruniqueId": profileController.useruniqueIdStored.value == ""
                ? profileController.viewProfileData.value.useruniqueId
                : profileController.useruniqueIdStored.value,
            "email": profileController.emailStored.value == ""
                ? profileController.viewProfileData.value.email
                : profileController.emailStored.value,
            "profile_image": profileController.savedImage.value == ""
                ? profileController.viewProfileData.value.profileImage
                : profileController.savedImage.value,
            "bio": profileController.bioStored.value == ""
                ? profileController.viewProfileData.value.bio
                : profileController.bioStored.value,
            "gender": profileController.genderStored.value == ""
                ? profileController.viewProfileData.value.gender
                : profileController.genderStored.value,
            "dateOfBirth": profileController.dateTime.value.toIso8601String(),
            "phoneNumber": profileController.phoneNumberStored.value == ""
                ? profileController.viewProfileData.value.phoneNumber
                : profileController.phoneNumberStored.value,
            "interests": profileController.userInterests.value
          };

          await socketService.updateUser(
              profileController.viewProfileData.value.id, profiledata);

          profileController.profileLoading.value = true;
        }, false, textColor)
      ],
    ),
  );
}

class PickImageWidget extends StatefulWidget {
  const PickImageWidget({super.key});

  @override
  State<PickImageWidget> createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  Future pickImage(ImageSource source) async {
    try {
      final picture = await ImagePicker().pickImage(source: source);
      if (picture == null) return;
      File? newpicture = File(picture.path);
      setState(() {
        profileController.image = newpicture;
        Get.back();
      });
      // return announcecontroller.announcementImage;
    } on PlatformException catch (e) {
      return getErrorSnackBar("Failed to pick an Image, $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: profileController.image != null
            ? Image.file(profileController.image!, fit: BoxFit.fill)
            : CachedNetworkImage(
                imageUrl: profileController.viewProfileData.value.profileImage,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                imageBuilder: (context, imageprovider) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: heightSize(150),
                      width: widthSize(150),
                      decoration: const ShapeDecoration(
                          shape: OvalBorder(), color: textColor),
                      child: Container(
                        height: heightSize(140),
                        width: widthSize(140),
                        decoration: ShapeDecoration(
                            shape: const OvalBorder(),
                            image: DecorationImage(
                                image: imageprovider, fit: BoxFit.fill)),
                      ),
                    ),
                  );
                },
              ));
  }
}

class PickDateWidget extends StatefulWidget {
  final double width;
  const PickDateWidget({super.key, required this.width});

  @override
  State<PickDateWidget> createState() => _PickDateWidgetState();
}

class _PickDateWidgetState extends State<PickDateWidget> {
  ProfileController profileController = ProfileController.instance;

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: profileController.dateTime.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2200));
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final date = await pickDate();
        if (date == null) return;

        final newdate = DateTime(date.year, date.month, date.day);

        setState(() {
          profileController.dateTime.value = newdate;
        });
      },
      child: Container(
        height: heightSize(80),
        padding: EdgeInsets.symmetric(
            vertical: heightSize(10), horizontal: widthSize(10)),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: textColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Date of Birth",
                style: GoogleFonts.poppins(
                  fontSize: widthSize(13),
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: heightSize(40),
              width: widget.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${profileController.dateTime.value.year} / ${profileController.dateTime.value.month} / ${profileController.dateTime.value.day}",
                      style: TextStyle(
                          color: const Color(0xFFB4B4B4),
                          fontSize: fontSize(15),
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.calendar_today,
                      size: heightSize(20),
                      color: textColor3,
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectProfileTags extends StatelessWidget {
  final String name;

  SelectProfileTags({super.key, required this.name});

  ProfileController profileController = ProfileController.instance;

  RxBool isSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected.value = !isSelected.value;
        profileController.toggleCategorySelection(name);
      },
      child: Container(
        height: heightSize(30),
        padding: EdgeInsets.symmetric(
            horizontal: widthSize(16), vertical: heightSize(6)),
        decoration: BoxDecoration(
            color: const Color(0xFF1A2137),
            borderRadius: BorderRadius.all(Radius.circular(widthSize(15))),
            border: Border.all(
                color: isSelected.value == true
                    ? textColor
                    : const Color(0xFF1F2138))),
        child: CText(
          text: name,
          size: 13,
          color: isSelected.value == true ? textColor : textColor3,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
