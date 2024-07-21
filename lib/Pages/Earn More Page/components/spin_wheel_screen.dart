import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import '../../../common/button-widget.dart';
import '../../../common/custom-text.dart';
import '../../../common/spindata.dart';
import '../../../utils/color.dart';
import '../../../utils/sizes.dart';

class SpinWheelScreen extends StatefulWidget {
  final double width;
  const SpinWheelScreen({super.key, required this.width});

  @override
  State<SpinWheelScreen> createState() => _SpinWheelScreenState();
}

class _SpinWheelScreenState extends State<SpinWheelScreen> {
  StreamController<int> streamcontroller = StreamController<int>();
  final List<int> forbiddenIndexes = [3, 5, 6];

  void spinWheel() {
    final random = Random();
    int selectedIndex;

    do {
      selectedIndex = random.nextInt(wheelitems.length);
    } while (forbiddenIndexes.contains(selectedIndex));

    streamcontroller.add(selectedIndex);
  }

  @override
  void dispose() {
    streamcontroller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
      child: Container(
        height: heightSize(456),
        width: widget.width,
        padding: EdgeInsets.only(
            top: heightSize(34),
            left: widthSize(18),
            right: widthSize(20),
            bottom: heightSize(34)),
        decoration: ShapeDecoration(
          color: const Color(0xFF0E1528),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: heightSize(44),
                width: widthSize(179),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CText(
                      text: "Spin and earn",
                      color: Colors.white,
                      size: 20,
                      textAlign: TextAlign.center,
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w600,
                    ),
                    CText(
                      text: "Spin and earn amazing rewards",
                      color: Colors.white,
                      size: 12,
                      textAlign: TextAlign.center,
                      fontFamily: UsedFonts.poppins,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightSize(267),
                width: widthSize(300),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/Spin/spin3.png",
                        fit: BoxFit.fill,
                        height: heightSize(263),
                        width: widthSize(263),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/Spin/spin1.png",
                        fit: BoxFit.fill,
                        height: heightSize(259),
                        width: widthSize(259),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/Spin/spin2.png",
                        fit: BoxFit.fill,
                        height: heightSize(223),
                        width: widthSize(223),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: heightSize(219),
                        width: widthSize(219),
                        child: FortuneWheel(
                          duration: const Duration(seconds: 5),
                          styleStrategy: const UniformStyleStrategy(
                              color: Colors
                                  .black, // <-- custom circle slice fill color
                              // borderColor: Colors
                              //     .green, // <-- custom circle slice stroke color
                              borderWidth: 2,
                              textAlign: TextAlign.start),
                          indicators: [
                            FortuneIndicator(
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  "assets/images/Spin/pointer.png",
                                  height: heightSize(24),
                                  width: widthSize(20),
                                ))
                          ],
                          animateFirst: false,
                          selected: streamcontroller.stream,
                          items: wheelitems,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/Spin/spin4.png",
                        height: heightSize(40),
                        width: widthSize(40),
                      ),
                    )
                  ],
                ),
              ),
              buttonsWidget(context, heightSize(40), widthSize(264), "Spin",
                  mainColor, 12, () => spinWheel(), false, Colors.white)
            ]),
      ),
    );
  }
}
