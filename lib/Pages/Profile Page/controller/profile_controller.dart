import "dart:io";

import "package:cloudinary/cloudinary.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";
import "package:path_provider/path_provider.dart";
import "package:video_thumbnail/video_thumbnail.dart";

import "../../../common/getxmessage.dart";
import "../../../models/post-data.dart";
import "../../../models/user_data.dart";

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();

  RxBool profileLoading = false.obs;
  RxBool thumbnailLoading = false.obs;

  Rx<User> viewProfileData = User(
    id: "",
    username: "",
    useruniqueId: '',
    email: "",
    otp: "",
    profileImage: "",
    bio: "",
    gender: "",
    dateOfBirth: DateTime.now(),
    linked: false,
    phoneNumber: "",
    mainBalance: 0,
    gemspoint: 0,
    dailyPoints: 0,
    jar: Jar(points: 0, purchased: false, limit: 0, totalEarned: 0),
    following: [],
    followers: [],
    interests: [],
    socialMediaLinks:
        SocialMediaLinks(facebook: "", youtube: "", instagram: '', twitter: ''),
    blockedUsers: [],
    dog: Dog(dogName: "", dogreward: 0),
  ).obs;

// User Post
  RxList<PostForYou> userPostList = <PostForYou>[].obs;
  RxList<PostForYou> userVideoList = <PostForYou>[].obs;
  RxInt viewprofileslide = 0.obs;

  // Edit Profile data
  RxString usernameStored = "".obs;
  RxString useruniqueIdStored = "".obs;
  RxString bioStored = "".obs;
  RxString phoneNumberStored = "".obs;
  RxString emailStored = "".obs;
  RxString genderStored = "".obs;
  File? image;
  RxString savedImage = "".obs;
  Rx<DateTime> dateTime = DateTime(2023, 05, 12, 5, 30).obs;
  RxList<String> userInterests = <String>[].obs;

  // Social Edits
  RxString facebookStored = "".obs;
  RxString instagramStored = "".obs;
  RxString youtubeStored = "".obs;
  RxString twitterStored = "".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  String engagementShortened(int number) {
    if (number >= 1000000000) {
      return '${(number / 1000000000).toStringAsFixed(1)}B';
    } else if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    } else {
      return number.toString();
    }
  }

  void toggleCategorySelection(String item) {
    if (userInterests.contains(item)) {
      userInterests.remove(item);
    } else {
      userInterests.add(item);
    }
  }

  uploadImage(File image) async {
    try {
      final response = await cloudinary.upload(
          file: image.path, resourceType: CloudinaryResourceType.image);

      if (response.isSuccessful) {
        savedImage.value = response.secureUrl!;
      } else {
        getErrorSnackBar("Image upload was unsuccesful");
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  final cloudinary = Cloudinary.signedConfig(
    apiKey: "835465682576292",
    apiSecret: "8PE5JLnAugyOstV3EPuE7xrmcbQ",
    cloudName: "dm4eqhtyx",
  );
}
