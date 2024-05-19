import 'package:duwith_social/Pages/Home%20Page/components/search_widgets.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';

import '../../../common/text-field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
                  children: [
                    SizedBox(height: heightSize(30)),
                    const InputTextField(
                        showPrefixIcon: true,
                        prefixIcon: Icons.search,
                        obscureText: false,
                        innerColor: buttonColor2,
                        hintText: "Search",
                        textColor: textColor,
                        differentiate: 1),
                    SizedBox(height: heightSize(30)),
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
