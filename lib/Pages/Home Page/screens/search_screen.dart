import 'package:duwith_social/Pages/Home%20Page/components/search_screen_componenets.dart';
import 'package:duwith_social/Pages/Home%20Page/components/search_widgets.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/text-field.dart';
import '../controllers/home_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  HomeController homeController = HomeController.instance;

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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: heightSize(30)),
                    searchFunction(
                        controller: homeController.searchtexts,
                        onChanged: (val) {
                          print("Search text: $val");
                        }),
                    SizedBox(height: heightSize(30)),
                    Text(
                      "Friends Suggestion",
                      style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: fontSize(14),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: heightSize(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        friendsOption(),
                        friendsOption(),
                        friendsOption()
                      ],
                    ),
                    SizedBox(height: heightSize(40)),
                    Row(
                      children: [
                        searchTrends("assets/images/Trends/firetrend.png",
                            "Trending", const Color(0xFF5E5EB2)),
                        SizedBox(width: widthSize(10)),
                        searchTrends("assets/images/Trends/locationtrend.png",
                            "Local", const Color(0xFF9176D0))
                      ],
                    ),
                    SizedBox(height: heightSize(12)),
                    Row(
                      children: [
                        searchTrends("assets/images/Trends/friendstrend.png",
                            "Friends", const Color(0xFFCE59B7)),
                        SizedBox(width: widthSize(10)),
                        searchTrends("assets/images/Trends/recentTrend.png",
                            "Recent", const Color(0xFFC259CE))
                      ],
                    ),
                    SizedBox(height: heightSize(30)),
                    searchTrendsList(context, constraints.maxWidth)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
