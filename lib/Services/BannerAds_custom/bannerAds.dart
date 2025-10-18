import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../utils/sizes.dart';

class ItemWithBanner extends StatefulWidget {
  final String someItemId;
  const ItemWithBanner({Key? key, required this.someItemId}) : super(key: key);

  @override
  State<ItemWithBanner> createState() => _ItemWithBannerState();
}

class _ItemWithBannerState extends State<ItemWithBanner> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  final fixedBanner = "ca-app-pub-3940256099942544/6300978111";

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: fixedBanner,
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => _isAdLoaded = true),
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          // handle error if needed
        },
      ),
      request: const AdRequest(),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isAdLoaded && _bannerAd != null) {
      return SizedBox(
        width: _bannerAd!.size.width.toDouble(),
        height: _bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      );
    } else {
      return const SizedBox();
    }
  }
}
