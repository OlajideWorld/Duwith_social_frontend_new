import "package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";
import "package:get/get_rx/get_rx.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/color.dart";
import "../../../utils/sizes.dart";

class LabeledInput extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const LabeledInput({
    Key? key,
    required this.label,
    this.hintText = '',
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // overall styling
      padding: EdgeInsets.only(
          left: widthSize(10),
          right: widthSize(10),
          top: heightSize(5),
          bottom: heightSize(5)),

      decoration: BoxDecoration(
        // border: Border.all(color: Color.fromARGB(255, 26, 37, 61)),
        // borderRadius: BorderRadius.only(),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Row(
        children: [
          // Left label
          Text(
            label,
            style: GoogleFonts.poppins(
                color: textColor,
                fontSize: fontSize(13),
                fontWeight: FontWeight.w500),
          ),

          // Space between
          SizedBox(width: 16),

          // Right-side TextFormField
          Expanded(
            child: TextFormField(
              textAlign: TextAlign.right, // put cursor & text on the right
              textDirection: TextDirection.rtl,
              controller: controller,
              validator: validator,
              keyboardType: TextInputType.number, // show number keyboard
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly, // allow only numbers (0-9)
              ],
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: fontSize(13),
                fontWeight: FontWeight.w400,
              ),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintTextDirection: TextDirection.rtl,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 144, 144, 144),
                    fontSize: fontSize(13),
                    fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

showTextforTask(double width, String text1, String text2, double height) {
  return SizedBox(
    height: heightSize(height),
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: fontSize(14),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: widthSize(280),
              child: Text(
                textAlign: TextAlign.left,
                text2,
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 144, 144, 144),
                  fontSize: fontSize(12),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        Icon(Icons.arrow_forward_ios, size: heightSize(15), color: textColor),
      ],
    ),
  );
}
