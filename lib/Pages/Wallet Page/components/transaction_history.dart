// ignore_for_file: invalid_use_of_protected_member

import "package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";

import "../../../common/custom-text.dart";
import "../../../utils/color.dart";
import "../../../utils/demo_data.dart";

HomeController homeController = HomeController.instance;

transactionHistoryList(BuildContext contextm, double width) {
  return ListView.builder(
      itemCount: transactiondata.value.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: heightSize(12)),
          child: Column(
            children: [
              transactonHistoryDesign(
                  width: width,
                  image: "assets/images/social.png",
                  name: transactiondata.value[index].name,
                  amount: transactiondata.value[index].amount,
                  time: transactiondata.value[index].time,
                  date: transactiondata.value[index].date,
                  status: transactiondata.value[index].status),
            ],
          ),
        );
      });
}

transactonHistoryDesign(
    {required double width,
    required String image,
    required String name,
    required String amount,
    required String time,
    required String date,
    required bool status}) {
  return SizedBox(
    height: heightSize(40),
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: heightSize(40),
          width: widthSize(205),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: heightSize(40),
                width: widthSize(40),
                decoration: BoxDecoration(
                    color: const Color(0xFF343232),
                    borderRadius:
                        BorderRadius.all(Radius.circular(widthSize(19.5)))),
                child: Padding(
                  padding: EdgeInsets.all(widthSize(9)),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: widthSize(9)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CText(
                    text: name,
                    size: 14.22,
                    color: Color(0xFFECECEC),
                    fontFamily: UsedFonts.poppins,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CText(
                        text: date,
                        size: 11,
                        color: const Color(0xFF706F6F),
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(width: widthSize(5)),
                      CText(
                        text: time,
                        size: 11.44,
                        color: Color(0xFF706F6F),
                        fontFamily: UsedFonts.poppins,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: heightSize(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CText(
                text: amount,
                size: 14.33,
                color: textColor,
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: heightSize(8)),
              CText(
                text: status ? "Completed" : "Pending",
                size: 11,
                color: status ? Colors.green : const Color(0xFFDDC446),
                fontFamily: UsedFonts.poppins,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
