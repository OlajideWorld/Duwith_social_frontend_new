// ignore_for_file: must_be_immutable

import "package:duwith_social/Pages/Auth%20Page/controller/auth_controller.dart";
import "package:duwith_social/utils/color.dart";
import "package:flutter/material.dart";
import "package:flutter_tawk/flutter_tawk.dart";

class CustomerSupportScreen extends StatelessWidget {
  CustomerSupportScreen({super.key});

  AuthController authController = AuthController.instance;

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
              child: Tawk(
                directChatLink:
                    'https://tawk.to/chat/66a5724232dca6db2cb69ffd/1i3r4cld5',
                visitor: TawkVisitor(
                  name: authController.userdata.value.username,
                  email: authController.userdata.value.email,
                ),
                onLoad: () {
                  print('Hello Tawk!');
                },
                onLinkTap: (String url) {
                  print(url);
                },
                placeholder: const Center(
                  child: Text('Loading...Contacting Support'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
