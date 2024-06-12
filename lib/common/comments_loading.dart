import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/sizes.dart';

class CommentShimmerLoading extends StatelessWidget {
  const CommentShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 68, 64, 86),
        highlightColor: Color.fromARGB(255, 100, 95, 129),
        child: ListView.separated(
            separatorBuilder: (_, index) => SizedBox(height: heightSize(16)),
            itemCount: 10,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return showCommentsShimmer(width);
            }),
      ),
    );
  }
}

showCommentsShimmer(double width) {
  return Container(
    height: heightSize(80),
    padding: const EdgeInsets.all(10),
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: widthSize(20),
              ),
              SizedBox(width: widthSize(10)),
              Container(
                height: heightSize(80),
                width: widthSize(238),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(widthSize(15)))),
              )
            ],
          ),
        ),
        Container(
          height: heightSize(40),
          width: widthSize(40),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(widthSize(15)))),
        )
      ],
    ),
  );
}
