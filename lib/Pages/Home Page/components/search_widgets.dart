// ignore_for_file: invalid_use_of_protected_member

import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/demo_data.dart';

HomeController homeController = HomeController.instance;

searchTrends(String image, String name, Color colorUsed) {
  return Expanded(
    child: Container(
      height: heightSize(36),
      padding: EdgeInsets.only(left: widthSize(12)),
      decoration: BoxDecoration(
          color: colorUsed,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          SizedBox(
            height: heightSize(16),
            width: widthSize(16),
            child: Image.asset(image),
          ),
          SizedBox(width: widthSize(4)),
          Text(
            name,
            style: GoogleFonts.poppins(
              color: textColor,
              fontSize: fontSize(12),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}

searchTrendsList(BuildContext context, double width) {
  return Expanded(
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of items per row
          crossAxisSpacing: heightSize(12), // Spacing between columns
          mainAxisSpacing: widthSize(9), // Spacing between rows
          childAspectRatio: 1.0, // Aspect ratio of each item (width / height)
        ),
        itemCount: searchgridList.value.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              popularTrends(searchgridList.value[index].image,
                  searchgridList.value[index].name)
            ],
          );
        }),
  );
}

popularTrends(String image, String value) {
  return Container(
    height: heightSize(112),
    width: widthSize(112),
    decoration: BoxDecoration(
        color: const Color(0xFF383840),
        borderRadius: BorderRadius.all(Radius.circular(widthSize(10)))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: heightSize(86),
          width: widthSize(112),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(widthSize(10)),
                  topRight: Radius.circular(widthSize(10))),
              image: DecorationImage(image: AssetImage(image))),
        ),
        SizedBox(height: heightSize(5)),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: fontSize(12),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
