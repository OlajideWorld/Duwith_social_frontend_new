import "dart:io";

import "package:duwith_social/Pages/Auth%20Page/components/login_select.dart";
import "package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart";
import "package:duwith_social/Pages/Post%20page/screens/post_image.dart";
import "package:duwith_social/common/custom-text.dart";
import "package:duwith_social/common/getxmessage.dart";
import "package:duwith_social/utils/color.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";

import "../Pages/Auth Page/controller/auth_controller.dart";
import "../utils/sizes.dart";

class PickImageScreen extends StatefulWidget {
  const PickImageScreen({super.key});

  @override
  State<PickImageScreen> createState() => _PickImageScreenState();
}

class _PickImageScreenState extends State<PickImageScreen> {
  List<XFile> _imageFileList = [];
  HomeController homeController = HomeController.instance;
  AuthController authController = AuthController.instance;
  // Future pickImage(ImageSource source) async {
  //   try {
  //     final picture = await ImagePicker().pickImage(source: source);
  //     if (picture == null) return;
  //     File? newpicture = File(picture.path);
  //     setState(() {
  //       // announcecontroller.announcementImage = newpicture;
  //       Get.back();
  //     });
  //     // return announcecontroller.announcementImage;
  //   } on PlatformException catch (e) {
  //     return getErrorSnackBar("Failed to pick an Image, $e");
  //   }
  // }

  // Future pickVideo() async {
  //   try {
  //     final XFile? galleryVideo =
  //         await ImagePicker().pickVideo(source: ImageSource.gallery);
  //   } catch (e) {
  //     return getErrorSnackBar("Failed to pick a video, $e");
  //   }
  // }

  pickMultipleImages() async {
    try {
      final List<XFile> images = await ImagePicker().pickMultiImage();
      if (images != []) {
        setState(() {
          _imageFileList = images;
        });
      } else {
        Get.back();
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  pickMultipleVideos() async {
    try {
      final List<XFile> multiplevideo = await ImagePicker().pickMultipleMedia();
      if (multiplevideo != []) {
        setState(() {
          _imageFileList = multiplevideo;
        });
      } else {
        Get.back();
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  // showSheet(BuildContext context) {
  //   return showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             ListTile(
  //               leading: const Icon(Icons.camera_alt),
  //               title: const Text(
  //                 "Camera",
  //                 style: TextStyle(color: mainColor),
  //               ),
  //               onTap: () => pickImage(ImageSource.camera),
  //             ),
  //             ListTile(
  //               leading: const Icon(Icons.image),
  //               title: const Text(
  //                 "Gallery",
  //                 style: TextStyle(color: mainColor),
  //               ),
  //               onTap: () => pickImage(ImageSource.gallery),
  //             )
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        Row(
          children: [
            optionsUsed("assets/images/Post/posticon.png",
                const Color(0xFF9176D0), "Image opinion", () async {
              await pickMultipleImages();
              if (_imageFileList == []) {
                getSuccessSnackBarEdit("Images picked", "No Images picked");
              } else {
                Get.to(() => PostImageVideosScreen(
                      files: _imageFileList,
                      type: "image",
                    ));
              }
            }),
            SizedBox(width: widthSize(12)),
            optionsUsed("assets/images/Post/posticon2.png",
                const Color(0xFF5E5EB2), "Videos opinion", () async {
              await pickMultipleVideos();
              if (_imageFileList == []) {
                getSuccessSnackBarEdit("Videos picked", "No Videos picked");
              } else {
                Get.to(() => PostImageVideosScreen(
                      files: _imageFileList,
                      type: "video",
                    ));
              }
            })
          ],
        ),
        SizedBox(height: heightSize(11)),
        Row(
          children: [
            optionsUsed("assets/images/Post/posticon3.png",
                const Color(0xFFD444E4), "Texts opinion", () {
              debugPrint(authController.userId.value);
            }
                // () => getSuccessSnackBarEdit("Notification", "Coming Soon"),
                ),
            SizedBox(width: widthSize(12)),
            optionsUsed(
              "assets/images/Post/posticon4.png",
              const Color(0xFF8D59CE),
              "Article opinion",
              () {
                homeController.fetchPosts();
              },
            )
          ],
        ),
      ],
    ));
  }

  optionsUsed(
      String image, Color background, String textused, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: heightSize(135),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              vertical: heightSize(33), horizontal: widthSize(28)),
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.all(Radius.circular(widthSize(10)))),
          child: SizedBox(
            height: heightSize(68),
            width: widthSize(109),
            child: Column(
              children: [
                SizedBox(
                    height: heightSize(50),
                    width: widthSize(50),
                    child: Image.asset(image)),
                CText(
                  text: textused,
                  size: 14,
                  color: textColor,
                  fontFamily: UsedFonts.poppins,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
