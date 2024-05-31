import "dart:io";

import "package:duwith_social/common/getxmessage.dart";
import "package:duwith_social/utils/color.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";

class PickImageScreen extends StatefulWidget {
  const PickImageScreen({super.key});

  @override
  State<PickImageScreen> createState() => _PickImageScreenState();
}

class _PickImageScreenState extends State<PickImageScreen> {
  File? picture;

  final List<File> multipleimage = [];

  Future pickImage(ImageSource source) async {
    try {
      final picture = await ImagePicker().pickImage(source: source);
      if (picture == null) return;
      File? newpicture = File(picture.path);
      setState(() {
        // announcecontroller.announcementImage = newpicture;
        Get.back();
      });
      // return announcecontroller.announcementImage;
    } on PlatformException catch (e) {
      return getErrorSnackBar("Failed to pick an Image, $e");
    }
  }

  Future pickVideo() async {
    try {
      final XFile? galleryVideo =
          await ImagePicker().pickVideo(source: ImageSource.gallery);
    } catch (e) {
      return getErrorSnackBar("Failed to pick a video, $e");
    }
  }

  pickMultipleImages() async {
    try {
      final List<XFile> images = await ImagePicker().pickMultiImage();
    } catch (e) {}
  }

  pickMultipleVideos() async {
    try {
      final List<XFile> multiplevideo = await ImagePicker().pickMultipleMedia();
    } catch (e) {}
  }

  showSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text(
                  "Camera",
                  style: TextStyle(color: mainColor),
                ),
                onTap: () => pickImage(ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text(
                  "Gallery",
                  style: TextStyle(color: mainColor),
                ),
                onTap: () => pickImage(ImageSource.gallery),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.file(
        picture!,
        // announcecontroller.announcementImage!,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
