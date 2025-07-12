import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../models/post-data.dart';
import '../../../utils/sizes.dart';

class MediaVideoPlayerWidget2 extends StatefulWidget {
  final PostForYou post;
  final bool isActive;
  final double width;
  const MediaVideoPlayerWidget2({
    super.key,
    required this.post,
    required this.isActive,
    required this.width,
  });

  @override
  State<MediaVideoPlayerWidget2> createState() =>
      _MediaVideoPlayerWidget2State();
}

class _MediaVideoPlayerWidget2State extends State<MediaVideoPlayerWidget2> {
  late VideoPlayerController _videoController;

  bool _isPlaying = false;

  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.network(widget.post.media.single.url)
          ..initialize().then((_) {
            setState(() {
              _isInitialized = true;
            });
            if (widget.isActive) {
              _videoController.setLooping(true);
              _videoController.play();
              setState(() {
                _isPlaying = true;
              });
            }
          });
  }

  @override
  void didUpdateWidget(MediaVideoPlayerWidget2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the “active” flag changed, play/pause accordingly:
    if (widget.isActive && !_isPlaying && _isInitialized) {
      _videoController.play();
      setState(() {
        _isPlaying = true;
      });
    } else if (!widget.isActive && _isPlaying && _isInitialized) {
      _videoController.pause();
      setState(() {
        _isPlaying = false;
      });
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _onTapVideo() {
    if (!_isInitialized) return;
    if (_isPlaying) {
      _videoController.pause();
    } else {
      _videoController.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(400),
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_isInitialized)
            GestureDetector(
              onTap: _onTapVideo,
              child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  height: heightSize(400),
                  width: widget.width,
                  child: VideoPlayer(_videoController),
                ),
              ),
            )
          else
            // while initializing, show a black background + CircularProgressIndicator
            Container(color: Colors.black),
          if (!_isInitialized) const Center(child: CircularProgressIndicator()),
          SizedBox(height: heightSize(10)),
          // PostContent(
          //     isExpanded: isExpanded,
          //     text: widget.post.caption,
          //     size: 15,
          //     color: const Color(0xFFD7D7D7),
          //     fontFamily: UsedFonts.poppins,
          //     fontWeight: FontWeight.w400),
          // SizedBox(height: heightSize(5)),
          // Text(
          //   widget.post.user.username,
          //   textAlign: TextAlign.center,
          //   style: GoogleFonts.poppins(
          //     color: textColor3,
          //     fontSize: fontSize(12),
          //     fontWeight: FontWeight.w400,
          //   ),
          // ),
          // SizedBox(height: heightSize(10)),
          // SizedBox(
          //   width: widget.type == 1 ? widthSize(338) : widget.width,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       // mediaPostUserDetails(
          //       //     widget.post.user.id,
          //       //     widthSize(130),
          //       //     widget.post.user.username,
          //       //     widget.post.user.profileImage,
          //       //     context,
          //       //     true),
          //       Container(
          //         height: heightSize(20),
          //         width: widthSize(110),
          //         alignment: Alignment.center,
          //         decoration: BoxDecoration(
          //           color: const Color(0xFFE0E00A),
          //           borderRadius: BorderRadius.all(
          //             Radius.circular(widthSize(10)),
          //           ),
          //         ),
          //         child: Row(
          //           children: [
          //             SizedBox(
          //               height: heightSize(15),
          //               width: widthSize(15),
          //               child: Image.asset(
          //                 'assets/images/Home/dotIcon.png',
          //                 fit: BoxFit.contain,
          //                 // color: homeController.viewBarOption.value == 1
          //                 //     ? const Color(0xFFECECEC)
          //                 //     : textColor3,
          //               ),
          //             ),
          //             Text(
          //               "133.00579  DOT",
          //               style: GoogleFonts.plusJakartaSans(
          //                 color: const Color(0xFF000000),
          //                 fontSize: fontSize(12),
          //                 fontWeight: FontWeight.w500,
          //               ),
          //             ),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
