import 'package:duwith_social/models/main_post_model.dart';
import 'package:duwith_social/models/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

import '../../../models/post-data.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  RxBool homeloading = false.obs;
  RxBool continueLoading = false.obs;

  RxInt viewBarOption = 0.obs;
  RxInt viewprofileslide = 0.obs;
  RxInt selectedWithdrawal = 0.obs;
  RxInt selectedIndex = 0.obs;

  // WIthdrawal Values
  TextEditingController email = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController accountnumber = TextEditingController();

  // Comments
  RxList<Comment> comments = <Comment>[].obs;

  // Posts
  RxList<Post> postList = <Post>[].obs;
  Rx<QueryParams> queryParams =
      QueryParams(userId: "", following: [], interests: [], sortby: "CreatedAt")
          .obs;

  RxList<PostsData> postDatas = [
    PostsData(
        name: "Olasehinde Matthew",
        image: "assets/images/post.png",
        content:
            "🎉 Airdrop Alert! 🎉We're excited to announce our exclusive airdrop event! 🚀✨🌟 What’s up for grabs? Free tokens for our loyal users! Special rewards for new signups!👥 How to Participate",
        postType: 1,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Jacob Jones",
        image: "assets/images/post.png",
        content:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus.",
        postType: 2,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Olajide Timothy",
        image: "assets/images/post.png",
        content:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus.",
        postType: 3,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Bustin Tunde",
        image: "assets/images/post.png",
        content:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus.",
        postType: 1,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Boss Chris",
        image: "assets/images/post.png",
        content:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus.",
        postType: 3,
        likes: 12346576,
        dislikes: 123,
        comment: 1234)
  ].obs;

  RxList<PostsData> postDatasPost = [
    PostsData(
        name: "Olasehinde Matthew",
        image: "assets/images/post2.png",
        content: "",
        postType: 1,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Jacob Jones",
        image: "assets/images/post2.png",
        content: "",
        postType: 2,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Jacob Jones",
        image: "assets/images/post2.png",
        content: "",
        postType: 2,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Jacob Jones",
        image: "assets/images/post2.png",
        content: "",
        postType: 2,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Jacob Jones",
        image: "assets/images/post2.png",
        content: "",
        postType: 2,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Jacob Jones",
        image: "assets/images/post2.png",
        content: "",
        postType: 2,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Olajide Timothy",
        image: "assets/images/post2.png",
        content: "",
        postType: 3,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Bustin Tunde",
        image: "assets/images/post2.png",
        content: "",
        postType: 1,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Boss Chris",
        image: "assets/images/post2.png",
        content: "",
        postType: 3,
        likes: 12346576,
        dislikes: 123,
        comment: 1234)
  ].obs;

  RxList<PostsData> searchTrends = [
    PostsData(
        name: "Entertainment",
        image: "assets/images/post2.png",
        content: "",
        postType: 1,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Workout",
        image: "assets/images/post2.png",
        content: "",
        postType: 2,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Music",
        image: "assets/images/post2.png",
        content: "",
        postType: 2,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Education",
        image: "assets/images/post2.png",
        content: "",
        postType: 2,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Health",
        image: "assets/images/post2.png",
        content: "",
        postType: 2,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Financial market",
        image: "assets/images/post2.png",
        content: "",
        postType: 2,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Investment",
        image: "assets/images/post2.png",
        content: "",
        postType: 3,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Power",
        image: "assets/images/post2.png",
        content: "",
        postType: 1,
        likes: 12346576,
        dislikes: 123,
        comment: 1234),
    PostsData(
        name: "Movies",
        image: "assets/images/post2.png",
        content: "",
        postType: 3,
        likes: 12346576,
        dislikes: 123,
        comment: 1234)
  ].obs;

  RxList<TransactionHistory> transactiondata = [
    TransactionHistory(
        name: "Solana ",
        amount: "\$20,304",
        time: "08:48 am",
        date: "15-03-2023",
        status: false),
    TransactionHistory(
        name: "Athens ",
        amount: "\$20,304",
        time: "08:48 am",
        date: "15-03-2023",
        status: false),
    TransactionHistory(
        name: "Athens ",
        amount: "\$20,304",
        time: "08:48 am",
        date: "15-03-2023",
        status: true),
    TransactionHistory(
        name: "Wen ",
        amount: "\$20,304",
        time: "08:48 am",
        date: "15-03-2023",
        status: true),
  ].obs;

  final List<String> allInterests = [
    'Technology',
    'Sports',
    'Music',
    'Movies',
    "Nature",
    "Travels",
    "Pest & Animals",
    "Events",
    "Quotes",
    "Books",
    "Music",
    "Tech",
    "Gadgets",
    "Fitness",
    "Adventures",
    "Food",
    "Fashion",
    "Lifestyles",
    "Arts"
    // Add more interests
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  String engagementShortened(int number) {
    if (number >= 1000000000) {
      return '${(number / 1000000000).toStringAsFixed(1)}B';
    } else if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    } else {
      return number.toString();
    }
  }

  String formatNumberWithCommasWithDouble(double number) {
    String formattedNumber = NumberFormat.decimalPattern().format(number);
    return formattedNumber;
  }
}
