import "package:duwith_social/Pages/Auth%20Page/services/socket_sevice.dart";
import "package:duwith_social/common/getxmessage.dart";
import "package:duwith_social/utils/color.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../utils/sizes.dart";
import "../controller/earn_controller.dart";
import "../screens/task_details.dart";
import "social_task_component.dart";

EarnController earnController = EarnController.instance;
SocketService socketService = SocketService.instance;
socialCampaignList(BuildContext context, double width) {
  return SizedBox(
      child: SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        socialCustomTaskContainer(
          context: context,
          width: width,
          socialName: "Facebook Task",
          socialImage: "assets/images/Earn/facebook.png",
          socialInstruction: "Follow us on Facebook",
          socialOverall: "0/5",
          whichpart: 1,
          isNew: true,
          onTap: () async {
            await socketService.getSocialTask(4);
            earnController.type.value = 4;
            await Get.to(() => const SocialTaskDetailsScreen(
                  taskName: "Facebook",
                  taskImage: "assets/images/Earn/facebook.png",
                ));
          },
        ),
        SizedBox(height: heightSize(10)),
        socialCustomTaskContainer(
          context: context,
          width: width,
          socialName: "YouTube Task",
          socialImage: "assets/images/Earn/youtube.png",
          socialInstruction: "Follow us on YouTube",
          socialOverall: "3/5",
          whichpart: 1,
          isNew: false,
          onTap: () async {
            await socketService.getSocialTask(2);
            earnController.type.value = 2;
            Get.to(() => const SocialTaskDetailsScreen(
                  taskName: "Youtube",
                  taskImage: "assets/images/Earn/youtube.png",
                ));
          },
        ),
        SizedBox(height: heightSize(10)),
        socialCustomTaskContainer(
          context: context,
          width: width,
          socialName: "Instagram task",
          socialImage: "assets/images/Earn/instagram.png",
          socialInstruction: "Follow us on Instagram",
          socialOverall: "0/5",
          whichpart: 1,
          isNew: true,
          onTap: () async {
            await socketService.getSocialTask(1);
            earnController.type.value = 1;
            Get.to(() => const SocialTaskDetailsScreen(
                  taskName: "Instagram",
                  taskImage: "assets/images/Earn/instagram.png",
                ));
          },
        ),
        SizedBox(height: heightSize(10)),
        socialCustomTaskContainer(
          context: context,
          width: width,
          socialName: "X Task",
          socialImage: "assets/images/Earn/twitter.png",
          socialInstruction: "Follow us on X",
          socialOverall: "0/5",
          whichpart: 1,
          isNew: true,
          onTap: () async {
            await socketService.getSocialTask(3);
            earnController.type.value = 3;
            Get.to(() => const SocialTaskDetailsScreen(
                  taskName: "Twitter(X)",
                  taskImage: "assets/images/Earn/twitter.png",
                ));
          },
        ),
        SizedBox(height: heightSize(10)),
        socialCustomTaskContainer(
          context: context,
          width: width,
          socialName: "TikTok Task",
          socialImage: "assets/images/Earn/TikTok.png",
          socialInstruction: "Follow us on Tiktok",
          socialOverall: "0/5",
          whichpart: 1,
          isNew: true,
          onTap: () => getSuccessSnackBar("Coming soon"),
        ),
        SizedBox(height: heightSize(10)),
        socialCustomTaskContainer(
          context: context,
          width: width,
          socialName: "Telegram Task",
          socialImage: "assets/images/Earn/Telegram.png",
          socialInstruction: "Follow us on Telegram",
          socialOverall: "0/5",
          whichpart: 1,
          isNew: true,
          onTap: () => getSuccessSnackBar("Coming soon"),
        ),
        SizedBox(height: heightSize(10)),
      ],
    ),
  ));
}

// Partnership
socialPartnershipList(BuildContext context, double width) {
  return SizedBox(
      child: SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        socialCustomTaskContainer(
          context: context,
          width: width,
          socialName: "Facebook Task",
          socialImage: "assets/images/Earn/facebook.png",
          socialInstruction: "Follow us on Facebook",
          socialOverall: "0/5",
          whichpart: 2,
          isNew: true,
          onTap: () async {
            await socketService.getSocialTask(4);
            earnController.type.value = 4;
            await Get.to(() => const SocialTaskDetailsScreen(
                  taskName: "Facebook",
                  taskImage: "assets/images/Earn/facebook.png",
                ));
          },
        ),
        SizedBox(height: heightSize(10)),
        socialCustomTaskContainer(
          context: context,
          width: width,
          socialName: "YouTube Task",
          socialImage: "assets/images/Earn/youtube.png",
          socialInstruction: "Follow us on YouTube",
          socialOverall: "3/5",
          whichpart: 2,
          isNew: false,
          onTap: () async {
            await socketService.getSocialTask(2);
            earnController.type.value = 2;
            Get.to(() => const SocialTaskDetailsScreen(
                  taskName: "Youtube",
                  taskImage: "assets/images/Earn/youtube.png",
                ));
          },
        ),
        SizedBox(height: heightSize(10)),
        socialCustomTaskContainer(
          context: context,
          width: width,
          socialName: "Instagram task",
          socialImage: "assets/images/Earn/instagram.png",
          socialInstruction: "Follow us on Instagram",
          socialOverall: "0/5",
          whichpart: 2,
          isNew: true,
          onTap: () async {
            await socketService.getSocialTask(1);
            earnController.type.value = 1;
            Get.to(() => const SocialTaskDetailsScreen(
                  taskName: "Instagram",
                  taskImage: "assets/images/Earn/instagram.png",
                ));
          },
        ),
        SizedBox(height: heightSize(10)),
        socialCustomTaskContainer(
          context: context,
          width: width,
          socialName: "X Task",
          socialImage: "assets/images/Earn/twitter.png",
          socialInstruction: "Follow us on X",
          socialOverall: "0/5",
          whichpart: 2,
          isNew: true,
          onTap: () async {
            await socketService.getSocialTask(3);
            earnController.type.value = 3;
            Get.to(() => const SocialTaskDetailsScreen(
                  taskName: "Twitter(X)",
                  taskImage: "assets/images/Earn/twitter.png",
                ));
          },
        ),
        SizedBox(height: heightSize(10)),
        socialCustomTaskContainer(
          context: context,
          width: width,
          socialName: "TikTok Task",
          socialImage: "assets/images/Earn/TikTok.png",
          socialInstruction: "Follow us on Tiktok",
          socialOverall: "0/5",
          whichpart: 2,
          isNew: true,
          onTap: () => getSuccessSnackBar("Coming soon"),
        ),
        SizedBox(height: heightSize(10)),
        socialCustomTaskContainer(
          context: context,
          width: width,
          socialName: "Telegram Task",
          socialImage: "assets/images/Earn/Telegram.png",
          socialInstruction: "Follow us on Telegram",
          socialOverall: "0/5",
          whichpart: 2,
          isNew: true,
          onTap: () => getSuccessSnackBar("Coming soon"),
        ),
        SizedBox(height: heightSize(10)),
      ],
    ),
  ));
}

// Special Social
socialSpecialTask(BuildContext context, double width) {
  return SizedBox(
    child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          socialSpecialWidget(
              context: context,
              width: width,
              specialName: "Daily Check-in",
              specialImage: "assets/images/Earn/movies.png",
              specialDetails: "Max claim available in 23:35:29",
              specialOverall: "0/5",
              specialButtonText: "Done",
              specialColor: textColor3,
              specialButton: Color.fromARGB(255, 98, 96, 96),
              specialButttonTextColor: Color.fromARGB(255, 196, 192, 192)),
          socialSpecialWidget(
              context: context,
              width: width,
              specialName: "\$DOT To The Moon",
              specialImage: "assets/images/Earn/telegrampremium.png",
              specialDetails: "2,336",
              specialOverall: "0/5",
              specialButtonText: "Start",
              specialColor: textColor,
              specialButton: textColor,
              specialButttonTextColor: Colors.black),
          socialSpecialWidget(
              context: context,
              width: width,
              specialName: "\$DOT To The Moon",
              specialImage: "assets/images/Earn/design2.png",
              specialDetails: "2,336",
              specialOverall: "0/5",
              specialButtonText: "Claim",
              specialColor: textColor,
              specialButton: const Color(0xFF5AD00D),
              specialButttonTextColor: Colors.black),
          socialSpecialWidget(
              context: context,
              width: width,
              specialName: "Daily Check-in",
              specialImage: "assets/images/Earn/movies.png",
              specialDetails: "Max claim available in 23:35:29",
              specialOverall: "0/5",
              specialButtonText: "Done",
              specialColor: textColor3,
              specialButton: Color.fromARGB(255, 98, 96, 96),
              specialButttonTextColor: Color.fromARGB(255, 196, 192, 192)),
          socialSpecialWidget(
              context: context,
              width: width,
              specialName: "\$DOT To The Moon",
              specialImage: "assets/images/Earn/telegrampremium.png",
              specialDetails: "2,336",
              specialOverall: "0/5",
              specialButtonText: "Start",
              specialColor: textColor,
              specialButton: textColor,
              specialButttonTextColor: Colors.black),
          socialSpecialWidget(
              context: context,
              width: width,
              specialName: "\$DOT To The Moon",
              specialImage: "assets/images/Earn/design2.png",
              specialDetails: "2,336",
              specialOverall: "0/5",
              specialButtonText: "Claim",
              specialColor: textColor,
              specialButton: const Color(0xFF5AD00D),
              specialButttonTextColor: Colors.black),
        ],
      ),
    ),
  );
}
