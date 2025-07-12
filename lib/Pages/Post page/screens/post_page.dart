import 'package:cached_network_image/cached_network_image.dart';
import 'package:duwith_social/Pages/Home%20Page/components/home_appBar.dart';
import 'package:duwith_social/Pages/Post%20page/components/post_airdrop_widgets.dart';
import 'package:duwith_social/Pages/Post%20page/components/post_content_widget.dart';
import 'package:duwith_social/Pages/Post%20page/screens/post_airdrop_page.dart';
import 'package:duwith_social/Pages/Post%20page/screens/post_image.dart';
import 'package:duwith_social/common/functions.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/button-widget.dart';
import '../../../common/custom-nav-bar.dart';
import '../../../common/custom-text.dart';
import '../../../common/getxmessage.dart';
import '../../../utils/sizes.dart';
import '../../Auth Page/controller/auth_controller.dart';
import '../../Auth Page/services/socket_sevice.dart';
import '../../Home Page/controllers/home_controller.dart';

class PostContentPage extends StatefulWidget {
  PostContentPage({super.key});

  @override
  State<PostContentPage> createState() => _PostContentPageState();
}

class _PostContentPageState extends State<PostContentPage> {
  // 1) The list of labels to show
  final List<String> _items = [
    'Mention',
    'Category',
    'Compare',
    'My Voice',
    'Image',
    'Video',
    'Airdrop',
  ];

  // 2) A matching list of functions you want to run when tapped
  late final List<VoidCallback> _callbacks;

  int _selectedIndex = -1;
  @override
  void initState() {
    super.initState();

    // Initialize _callbacks here—this can reference other methods in this State class
    _callbacks = [
      () => _onItemTapped(0),
      () => _onItemTapped(1),
      () => _onItemTapped(2),
      () => _onItemTapped(3),
      () => _onItemTapped(4),
      () => _onItemTapped(5),
      () => _onItemTapped(6),
    ];
  }

  // This is called whenever any item is tapped
  void _onItemTapped(int idx) async {
    setState(() {
      _selectedIndex = idx;
    });

    // Now run whatever logic you want per‐item:
    switch (idx) {
      case 0:
        print("You tapped Mention");
        break;
      case 1:
        print("You tapped Category");
        break;
      case 2:
        print("You tapped Comapre");
        break;
      case 3:
        print("You tapped My Voice");
        break;
      case 4:
        await pickMultipleImages();
        if (_imageFileList == []) {
          getSuccessSnackBarEdit("Images picked", "No Images picked");
          Get.back();
        } else {
          Get.to(() => PostImageVideosScreen(
                files: _imageFileList,
                type: "image",
              ));
        }
        break;
      case 5:
        await pickMultipleVideos();
        if (_imageFileList == []) {
          getSuccessSnackBarEdit("Videos picked", "No Videos picked");
          Get.back();
        } else {
          Get.to(() => PostImageVideosScreen(
                files: _imageFileList,
                type: "video",
              ));
        }
        break;
      case 6:
        Get.to(() => PostAirdropPage());
        break;
    }
  }

  AuthController authController = AuthController.instance;
  HomeController homeController = HomeController.instance;
  SocketService socket = SocketService.instance;
  List<XFile> _imageFileList = [];

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
              child: Stack(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: heightSize(10),
                          left: widthSize(20),
                          right: widthSize(20)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            backbutton(onTap: () => Get.back()),
                            SizedBox(height: heightSize(30)),
                            Padding(
                              padding: EdgeInsets.only(left: widthSize(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: authController
                                        .userdata.value.profileImage,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    imageBuilder: (context, imageprovider) {
                                      return Container(
                                        height: heightSize(50),
                                        width: widthSize(50),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            image: DecorationImage(
                                                image: imageprovider,
                                                fit: BoxFit.fill)),
                                      );
                                    },
                                  ),
                                  SizedBox(width: widthSize(10)),
                                  Text(
                                    authController.userdata.value.username,
                                    style: GoogleFonts.poppins(
                                      color: textColor,
                                      fontSize: fontSize(15),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: heightSize(10)),
                            writeOpinionsPostPage(constraints.maxWidth),
                            // const PickImageScreen()
                            SizedBox(height: heightSize(100)),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(_items.length, (i) {
                                final isSelected = i == _selectedIndex;
                                return GestureDetector(
                                  onTap: _callbacks[i],
                                  child: Container(
                                    height: heightSize(30),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: widthSize(16),
                                        vertical: heightSize(6)),
                                    decoration: BoxDecoration(
                                        // color: const Color(0xFF1A2137),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(widthSize(15))),
                                        border: Border.all(
                                            color: isSelected == true
                                                ? textColor
                                                : const Color(0xFF1F2138))),
                                    child: Text(
                                      _items[i],
                                      style: GoogleFonts.poppins(
                                        color: isSelected == true
                                            ? textColor
                                            : textColor3,
                                        fontSize: fontSize(12),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(() {
                    return homeController.ispostingtext.value == false
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: heightSize(100),
                                  left: widthSize(20),
                                  right: widthSize(20)),
                              child: GestureDetector(
                                onTap: () async {
                                  final imageType = {
                                    "type": "text",
                                    "url":
                                        "https://c8.alamy.com/comp/2Y37W5W/du-letter-logo-with-shield-shape-inside-shield-badge-crown-on-white-background-template-design-2Y37W5W.jpg"
                                  };
                                  final postTextMap = {
                                    "user": authController.userId.value,
                                    "categories": [
                                      "Events",
                                      "Fashion",
                                      "Lifestyles"
                                    ],
                                    "commentsEnabled":
                                         homeController.commentingOpton.value,
                                    "showCaption":
                                        homeController.showCaption.value,
                                    "showLikes": homeController.hideLike.value,
                                    "media": imageType,
                                    "caption":
                                        homeController.postText.text.trim()
                                  };

                                  if (homeController.postText.text.trim() ==
                                      "") {
                                    getSuccessSnackBarEdit("Post hint",
                                        "You need to Add your opinion before you post");
                                  } else {
                                    homeController.ispostingtext.value = true;
                                    await socket.createPost(postTextMap);
                                    homeController.postText.text = "";
                                    homeController.ispostingtext.value = false;
                                    Get.back();
                                  }
                                },
                                child: Container(
                                    height: heightSize(50),
                                    width: constraints.maxWidth,
                                    decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(widthSize(25)),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Post Now",
                                        style: GoogleFonts.poppins(
                                          color: textColor,
                                          fontSize: fontSize(16),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: heightSize(70),
                              width: widthSize(100),
                              child: const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(textColor),
                              ),
                            ),
                          );
                  })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
