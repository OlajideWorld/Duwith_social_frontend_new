// ignore_for_file: library_private_types_in_public_api

import 'package:better_player_plus/better_player_plus.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:chewie/chewie.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import 'package:duwith_social/utils/sizes.dart';
import "package:flutter/material.dart";
import 'package:video_player/video_player.dart';

class VideoStreamPage extends StatefulWidget {
  final String url;

  const VideoStreamPage({super.key, required this.url});

  @override
  _VideoStreamPageState createState() => _VideoStreamPageState();
}

class _VideoStreamPageState extends State<VideoStreamPage> {
  bool isVideoInitialized = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url));

  //   chewieController = ChewieController(
  //       videoPlayerController: _controller, autoPlay: true, looping: true);

  //   _controller.initialize().then((_) {
  //     setState(() {});
  //     isVideoInitialized = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const CText(
          text: "Video Preview",
          color: Colors.white,
          size: 18,
          textAlign: TextAlign.center,
          fontFamily: UsedFonts.poppins,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Container(
          height: heightSize(400),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(widthSize(20)))),
          child: BetterPlayer.network(
            widget.url,
            betterPlayerConfiguration: const BetterPlayerConfiguration(
              aspectRatio: 1,
            ),
          ),
        ),
      ),
    );
  }
}
