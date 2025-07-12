import "package:duwith_social/utils/color.dart";
import "package:duwith_social/utils/sizes.dart";
import "package:flutter/material.dart";
import "package:shimmer/shimmer.dart";

class ShimmerLoadingWidget extends StatelessWidget {
  final double width;
  const ShimmerLoadingWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 68, 64, 86),
        highlightColor: Color.fromARGB(255, 100, 95, 129),
        child: ListView.separated(
          separatorBuilder: (_, index) => SizedBox(height: heightSize(16)),
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return showWidget(width);
          },
        ),
      ),
    );
  }
}

showWidget(double width) {
  return SizedBox(
    height: heightSize(350),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: heightSize(38),
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: heightSize(38),
                width: widthSize(200),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: widthSize(20),
                    ),
                    SizedBox(width: widthSize(5)),
                    SizedBox(
                      height: heightSize(38),
                      width: widthSize(100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: heightSize(10),
                            width: widthSize(100),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(widthSize(10)),
                              ),
                            ),
                          ),
                          SizedBox(height: heightSize(8)),
                          Container(
                            height: heightSize(5),
                            width: widthSize(100),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(widthSize(10)),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: heightSize(30),
                width: widthSize(100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(widthSize(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: heightSize(8)),
        Container(
          height: heightSize(40),
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(widthSize(10)),
            ),
          ),
        ),
        SizedBox(height: heightSize(8)),
        Container(
          height: heightSize(168),
          width: width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        SizedBox(height: heightSize(12)),
        Padding(
          padding: EdgeInsets.only(left: widthSize(10), right: widthSize(20)),
          child: SizedBox(
            height: heightSize(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: heightSize(18),
                  width: widthSize(250),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: heightSize(20),
                        width: widthSize(50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(widthSize(10)),
                          ),
                        ),
                      ),
                      // SizedBox(width: widthSize(12)),
                      //
                      Container(
                        height: heightSize(20),
                        width: widthSize(50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(widthSize(10)),
                          ),
                        ),
                      ),
                      // SizedBox(width: widthSize(12)),
                      //
                      Container(
                        height: heightSize(20),
                        width: widthSize(50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(widthSize(10)),
                          ),
                        ),
                      ),
                      // SizedBox(width: widthSize(12)),
                      //
                      Container(
                        height: heightSize(20),
                        width: widthSize(50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(widthSize(10)),
                          ),
                        ),
                      ),
                      // SizedBox(width: widthSize(12)),
                    ],
                  ),
                ),
                Container(
                  height: heightSize(20),
                  width: widthSize(50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(widthSize(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

showWidget2(double width, double height) {
  return Container(
    height: heightSize(height),
    decoration: const BoxDecoration(color: backgroundColor),
    width: width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: heightSize(200),
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: heightSize(38),
                width: widthSize(200),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: widthSize(20),
                    ),
                    SizedBox(width: widthSize(5)),
                    SizedBox(
                      height: heightSize(38),
                      width: widthSize(100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: heightSize(10),
                            width: widthSize(100),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(widthSize(10)),
                              ),
                            ),
                          ),
                          SizedBox(height: heightSize(8)),
                          Container(
                            height: heightSize(5),
                            width: widthSize(100),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(widthSize(10)),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: heightSize(30),
                width: widthSize(100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(widthSize(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: heightSize(20)),
        Container(
          height: heightSize(70),
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(widthSize(10)),
            ),
          ),
        ),
        SizedBox(height: heightSize(20)),
        Container(
          height: heightSize(250),
          width: width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        SizedBox(height: heightSize(30)),
        Padding(
          padding: EdgeInsets.only(left: widthSize(10), right: widthSize(20)),
          child: SizedBox(
            height: heightSize(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: heightSize(30),
                  width: widthSize(250),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: heightSize(20),
                        width: widthSize(50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(widthSize(10)),
                          ),
                        ),
                      ),
                      // SizedBox(width: widthSize(12)),
                      //
                      Container(
                        height: heightSize(20),
                        width: widthSize(50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(widthSize(10)),
                          ),
                        ),
                      ),
                      // SizedBox(width: widthSize(12)),
                      //
                      Container(
                        height: heightSize(20),
                        width: widthSize(50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(widthSize(10)),
                          ),
                        ),
                      ),
                      // SizedBox(width: widthSize(12)),
                      //
                      Container(
                        height: heightSize(20),
                        width: widthSize(50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(widthSize(10)),
                          ),
                        ),
                      ),
                      // SizedBox(width: widthSize(12)),
                    ],
                  ),
                ),
                Container(
                  height: heightSize(20),
                  width: widthSize(50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(widthSize(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
