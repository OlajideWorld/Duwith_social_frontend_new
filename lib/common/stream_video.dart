// ignore_for_file: library_private_types_in_public_api

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:duwith_social/common/custom-text.dart';
import 'package:duwith_social/utils/color.dart';
import "package:flutter/material.dart";
import 'package:video_player/video_player.dart';

class VideoStreamPage extends StatefulWidget {
  final String url;

  const VideoStreamPage({super.key, required this.url});

  @override
  _VideoStreamPageState createState() => _VideoStreamPageState();
}

class _VideoStreamPageState extends State<VideoStreamPage> {
  late CachedVideoPlayerPlusController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        CachedVideoPlayerPlusController.networkUrl(Uri.parse(widget.url))
          ..initialize().then((_) {
            setState(() {});
            _controller.play();
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: CachedVideoPlayerPlus(_controller),
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
