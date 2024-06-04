import 'package:duwith_social/Pages/Home%20Page/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:startapp_sdk/startapp.dart';

HomeController homeController = HomeController.instance;

class StartAppAdsClass {
// Load Banner Ads

  loadBannerAds() {
    homeController.startAppSdk
        .loadBannerAd(StartAppBannerType.BANNER)
        .then((bannerAd) {
      homeController.startBannerAd = bannerAd;
    }).onError<StartAppException>((ex, stackTrace) {
      debugPrint("Error loading Banner ad: ${ex.message}");
    }).onError((error, stackTrace) {
      debugPrint("Error loading Banner ad: $error");
    });
  }

  // Interstitial Ads
  void loadInterstitialAd() {
    homeController.startAppSdk.loadInterstitialAd(
      onAdDisplayed: () {
        // do something
      },
      onAdNotDisplayed: () {
        // do something

        homeController.startInterstitialAd!.dispose();
        homeController.startInterstitialAd = null;
      },
      onAdClicked: () {
        // do something
      },
      onAdHidden: () {
        // do something

        homeController.startInterstitialAd!.dispose();
        homeController.startInterstitialAd = null;
      },
    ).then((interstitialAd) {
      homeController.startInterstitialAd = interstitialAd;
    }).onError<StartAppException>((ex, stackTrace) {
      debugPrint("Error loading Interstitial ad: ${ex.message}");
    }).onError((error, stackTrace) {
      debugPrint("Error loading Interstitial ad: $error");
    });
  }

  // Rewarded Video Ads
  void loadRewardedVideoAd() {
    homeController.startAppSdk.loadRewardedVideoAd(
      onAdNotDisplayed: () {
        debugPrint('onAdNotDisplayed: rewarded video');
        homeController.startRewardedVideoAd!.dispose();
        homeController.startRewardedVideoAd = null;
      },
      onAdHidden: () {
        debugPrint('onAdHidden: rewarded video');

        homeController.startRewardedVideoAd!.dispose();
        homeController.startRewardedVideoAd = null;
      },
      onVideoCompleted: () {
        debugPrint(
            'onVideoCompleted: rewarded video completed, user gain a reward');
      },
    ).then((rewardedVideoAd) {
      homeController.startRewardedVideoAd = rewardedVideoAd;
    }).onError<StartAppException>((ex, stackTrace) {
      debugPrint("Error loading Rewarded Video ad: ${ex.message}");
    }).onError((error, stackTrace) {
      debugPrint("Error loading Rewarded Video ad: $error");
    });
  }
}
