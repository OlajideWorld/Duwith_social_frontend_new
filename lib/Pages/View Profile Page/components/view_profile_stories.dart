// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import '../../../utils/demo_data.dart';
import '../../../utils/sizes.dart';
import '../../Home Page/controllers/home_controller.dart';

// HomeController homeController = HomeController.instance;

// viewProfileStoriesList(BuildContext context) {
//   return Expanded(
//     child: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Number of items per row
//           crossAxisSpacing: heightSize(11), // Spacing between columns
//           mainAxisSpacing: widthSize(13), // Spacing between rows
//           childAspectRatio: 1.0, // Aspect ratio of each item (width / height)
//         ),
//         itemCount: postDatasPost.value.length,
//         itemBuilder: (context, index) {
//           return viewProfileStories(
//             postDatasPost.value[index].image,
//           );
//         }),
//   );
// }

// viewProfileStories(String image) {
//   return Container(
//     height: heightSize(186),
//     decoration: BoxDecoration(
//         image: DecorationImage(image: AssetImage(image)),
//         color: const Color(0xFF383840),
//         borderRadius: BorderRadius.all(Radius.circular(widthSize(10)))),
//   );
// }

// viewProfileVideosList(BuildContext context) {
//   return Expanded(
//     child: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Number of items per row
//           crossAxisSpacing: heightSize(11), // Spacing between columns
//           mainAxisSpacing: widthSize(13), // Spacing between rows
//           childAspectRatio: 1.0, // Aspect ratio of each item (width / height)
//         ),
//         itemCount: postDatasPost.value.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.only(bottom: heightSize(20)),
//             child: Stack(
//               children: [
//                 viewProfileStories(
//                   postDatasPost.value[index].image,
//                 ),
//                 Center(
//                   child: Image.asset(
//                     "assets/images/playsymbol.png",
//                     fit: BoxFit.contain,
//                   ),
//                 )
//               ],
//             ),
//           );
//         }),
//   );
// }
