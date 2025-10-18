// lib/widgets/video_page_item.dart

import 'package:duwith_social/Pages/For_You%20Page/components/media_video_widget.dart';
import 'package:duwith_social/Pages/For_You%20Page/components/media_video_widget2.dart';
import 'package:duwith_social/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:video_player/video_player.dart';

import '../../../common/custom-text.dart';
import '../../../models/post-data.dart';
import '../../Home Page/controllers/home_controller.dart';

class VideoPlayerWidget extends StatefulWidget {
  final PostForYou post;
  final bool isActive;
  final double width;
  const VideoPlayerWidget(
      {super.key,
      required this.post,
      required this.isActive,
      required this.width});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoController;
  bool _isPlaying = false;
  bool _isInitialized = false;

  HomeController homeController = HomeController.instance;

  BannerAd? _bannerAd;
  bool _isLoaded = false;

  final fixedBanner = "ca-app-pub-3940256099942544/6300978111";

  @override
  void initState() {
    super.initState();
    // Banner Ad
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: fixedBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) => setState(() => _isLoaded = true),
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          // optionally retry or fallback
        },
      ),
      request: AdRequest(),
    )..load();

// video Player
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
  void didUpdateWidget(VideoPlayerWidget oldWidget) {
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
    _bannerAd?.dispose();
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

  @override
  Widget build(BuildContext context) {
    final adSize = _bannerAd!.size;
    return Stack(
      children: [
        // if (_isInitialized)
        //   GestureDetector(
        //     onTap: _onTapVideo,
        //     child: SizedBox.expand(
        //       child: FittedBox(
        //         fit: BoxFit.cover,
        //         child: SizedBox(
        //           width: _videoController.value.size.width,
        //           height: _videoController.value.size.height,
        //           child: VideoPlayer(_videoController),
        //         ),
        //       ),
        //     ),
        //   )
        // else
        //   // while initializing, show a black background + CircularProgressIndicator
        //   Container(color: Colors.black),
        // if (!_isInitialized) const Center(child: CircularProgressIndicator()),
        Container(
          width: widget.width,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
        ),
        Positioned(
            top: heightSize(50),
            right: widthSize(20),
            left: widthSize(20),
            child: videoTopWidget(widget.width)),
        Positioned(
            right: widthSize(8),
            bottom: heightSize(150),
            child: foryouEnganementButtons(context, widget.post, widget.width)),
        Positioned(
          bottom: 0,
          left: widthSize(15),
          right: widthSize(15),
          child: Column(children: [
            foryouBottomContent(context, widget.post, widget.width),
            SizedBox(height: heightSize(5)),
            if (_isLoaded || _bannerAd != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(15)),
                child: SizedBox(
                  width: adSize.width.toDouble(),
                  height: adSize.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
            SizedBox(height: heightSize(15)),
          ]),
          // child: ,
        )
      ],
    );
  }
}
