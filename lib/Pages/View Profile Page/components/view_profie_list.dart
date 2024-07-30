// ignore_for_file: invalid_use_of_protected_member

import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import '../../../models/post-data.dart';
import '../../Profile Page/controller/profile_controller.dart';

// ProfileController profileController = ProfileController.instance;

// viewProfilePostList(BuildContext context, double width) {
//   return Expanded(
//     child: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Number of items per row
//           crossAxisSpacing: heightSize(12), // Spacing between columns
//           mainAxisSpacing: widthSize(9), // Spacing between rows
//           childAspectRatio: 1.0, // Aspect ratio of each item (width / height)
//         ),
//         itemCount: profileController.userPostList.value.length,
//         itemBuilder: (context, index) {
//           return ViewProfilePost(
//             postsData: profileController.userPostList.value[index],
//             width: width,
//           );
//         }),
//   );
// }

// class ViewProfilePost extends StatefulWidget {
//   final PostForYou postsData;
//   final double width;
//   const ViewProfilePost(
//       {super.key, required this.postsData, required this.width});

//   @override
//   State<ViewProfilePost> createState() => _ViewProfilePostState();
// }

// class _ViewProfilePostState extends State<ViewProfilePost> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: heightSize(112),
//       decoration: BoxDecoration(
//           color: const Color(0xFF383840),
//           borderRadius: BorderRadius.all(Radius.circular(widthSize(10)))),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: heightSize(88),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(widthSize(10)),
//                     topRight: Radius.circular(widthSize(10))),
//                 image: DecorationImage(image: AssetImage(image))),
//           ),
//           SizedBox(height: heightSize(15)),
//           SizedBox(
//             height: heightSize(12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(
//                   Icons.visibility_outlined,
//                   size: 12,
//                   color: textColor,
//                 ),
//                 SizedBox(width: widthSize(5)),
//                 CText(
//                   text: "$value Views",
//                   color: textColor,
//                   size: 9,
//                   fontFamily: UsedFonts.poppins,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
