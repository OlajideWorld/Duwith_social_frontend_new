import "package:duwith_social/Pages/Wallet%20Page/components/wallet_app_bar.dart";
import "package:duwith_social/common/button-widget.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../utils/color.dart";
import "../../../utils/sizes.dart";
import "../../Earn More Page/controller/earn_controller.dart";

EarnController earnController = EarnController.instance;

selectCustomerSupportView(BuildContext context) {
  return Obx(() {
    return SizedBox(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              earnController.chooseSupport.value = 0;
            },
            child: SizedBox(
              width: widthSize(40),
              height: heightSize(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'FAQ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: earnController.chooseSupport.value == 0
                          ? const Color(0xFFECECEC)
                          : textColor3,
                      fontSize: earnController.chooseSupport.value == 0
                          ? fontSize(17)
                          : fontSize(15),
                      fontWeight: earnController.chooseSupport.value == 0
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                  ),
                  // SizedBox(height: heightSize(7)),
                  earnController.chooseSupport.value == 0
                      ? Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: const Color(0xFFECECEC))
                      : const SizedBox()
                ],
              ),
            ),
          ),
          SizedBox(width: widthSize(10)),
          GestureDetector(
            onTap: () {
              earnController.chooseSupport.value = 1;
            },
            child: SizedBox(
              width: widthSize(150),
              height: heightSize(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email Support',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: earnController.chooseSupport.value == 1
                          ? const Color(0xFFECECEC)
                          : textColor3,
                      fontSize: earnController.chooseSupport.value == 1
                          ? fontSize(17)
                          : fontSize(15),
                      fontWeight: earnController.chooseSupport.value == 1
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                  ),
                  // SizedBox(height: heightSize(7)),
                  earnController.chooseSupport.value == 1
                      ? Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: const Color(0xFFECECEC))
                      : const SizedBox()
                ],
              ),
            ),
          ),
          //
          //
          SizedBox(width: widthSize(10)),
          GestureDetector(
            onTap: () {
              earnController.chooseSupport.value = 2;
            },
            child: SizedBox(
              width: widthSize(100),
              height: heightSize(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Whatsapp',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: earnController.chooseSupport.value == 2
                          ? const Color(0xFFECECEC)
                          : textColor3,
                      fontSize: earnController.chooseSupport.value == 2
                          ? fontSize(17)
                          : fontSize(15),
                      fontWeight: earnController.chooseSupport.value == 2
                          ? FontWeight.w600
                          : FontWeight.w500,
                    ),
                  ),
                  // SizedBox(height: heightSize(7)),
                  earnController.chooseSupport.value == 2
                      ? Divider(
                          height: heightSize(3),
                          thickness: 2,
                          color: const Color(0xFFECECEC))
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  });
}

faqCustomerList(double width) {
  return SizedBox(
    child: Column(
      children: [
        WalletFaqWidget(
          width: width,
          question: "How do I start streaming live video?",
          answer:
              "It's important to address common questions and concerns that users may have about the app. Here are some necessary questions to include",
        ),
        SizedBox(height: heightSize(15)),
        WalletFaqWidget(
          width: width,
          question: "Can I schedule live streams in advance?",
          answer:
              "It's important to address common questions and concerns that users may have about the app. Here are some necessary questions to include",
        ),
        SizedBox(height: heightSize(15)),
        WalletFaqWidget(
          width: width,
          question: "Is there a limit on the duration of live streams?",
          answer:
              "It's important to address common questions and concerns that users may have about the app. Here are some necessary questions to include",
        ),
        SizedBox(height: heightSize(15)),
        WalletFaqWidget(
          width: width,
          question: "Is there a limit on the duration of live streams?",
          answer:
              "It's important to address common questions and concerns that users may have about the app. Here are some necessary questions to include",
        ),
        SizedBox(height: heightSize(15)),
        WalletFaqWidget(
          width: width,
          question:
              "What safety and moderation features are in place for live streams?",
          answer:
              "It's important to address common questions and concerns that users may have about the app. Here are some necessary questions to include",
        ),
        SizedBox(height: heightSize(15)),
        WalletFaqWidget(
          width: width,
          question:
              "What safety and moderation features are in place for live streams?",
          answer:
              "It's important to address common questions and concerns that users may have about the app. Here are some necessary questions to include",
        ),
        SizedBox(height: heightSize(15)),
        WalletFaqWidget(
          width: width,
          question:
              "What safety and moderation features are in place for live streams?",
          answer:
              "It's important to address common questions and concerns that users may have about the app. Here are some necessary questions to include",
        ),
        SizedBox(height: heightSize(15)),
        WalletFaqWidget(
          width: width,
          question:
              "What safety and moderation features are in place for live streams?",
          answer:
              "It's important to address common questions and concerns that users may have about the app. Here are some necessary questions to include",
        ),
        SizedBox(height: heightSize(15)),
      ],
    ),
  );
}

emailSupportView(BuildContext context, double width) {
  return SizedBox(
    height: heightSize(180),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: heightSize(130),
          width: width,
          decoration: BoxDecoration(
              color: backgroundColor,
              // border: Border.all(color: Color(0xFF29324A)),
              borderRadius: BorderRadius.all(Radius.circular(widthSize(20)))),
          child: TextField(
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: const Color(0xFFB4B4B4),
                fontSize: fontSize(14)),
            maxLines: 5,
            controller: earnController.messageInput,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(
              hintText: "Write Your Message",
              hintStyle: GoogleFonts.poppins(
                  color: Color(0xFF918F99),
                  fontSize: fontSize(12),
                  fontWeight: FontWeight.w400),
              filled: true,
              fillColor: const Color(0xFF151B2E),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF29324A)),
                  borderRadius: BorderRadius.circular(16)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF29324A)),
                  borderRadius: BorderRadius.circular(16)),
              contentPadding: EdgeInsets.only(
                  left: widthSize(15),
                  top: heightSize(4),
                  right: widthSize(4),
                  bottom: heightSize(5)),
            ),
          ),
        ),
        buttonsWidget(context, heightSize(45), widthSize(250), "Send Message",
            Color(0xFF0062D6), fontSize(13), () {}, false, textColor)
      ],
    ),
  );
}

whatsappSupportView({required double width, required double height}) {
  String mobileNumber = "2349065500313";
  return SizedBox(
    height: heightSize(500),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "WhatsApp Support",
            style: GoogleFonts.poppins(
              color: textColor,
              fontSize: fontSize(18),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: heightSize(10)),
          Text(
            "Chat with us on Whatsapp:",
            style: GoogleFonts.poppins(
              color: textColor3,
              fontSize: fontSize(14),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: heightSize(10)),
          GestureDetector(
            onTap: () => earnController.openWhatsApp(mobileNumber),
            child: Text(
              "+$mobileNumber",
              style: GoogleFonts.poppins(
                color: Colors.green,
                fontSize: fontSize(16),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
