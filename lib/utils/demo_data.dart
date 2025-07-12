import 'package:get/get.dart';

import '../models/games_model.dart';
import '../models/post-data.dart';
import '../models/transaction_history.dart';

RxList<PostsData> comments = [
  PostsData(
      name: "Olasehinde Matthew",
      image: "assets/images/post2.png",
      content:
          "The large screen real estate allows me to multitask effortlessly and boost my ego",
      postType: 1,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Jacob Jones",
      image: "assets/images/post2.png",
      content:
          "The large screen real estate allows me to multitask effortlessly and boost my ego",
      postType: 2,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Jacob Jones",
      image: "assets/images/post2.png",
      content:
          "The large screen real estate allows me to multitask effortlessly and boost my ego",
      postType: 2,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Jacob Jones",
      image: "assets/images/post2.png",
      content:
          "The large screen real estate allows me to multitask effortlessly and boost my ego",
      postType: 2,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Jacob Jones",
      image: "assets/images/post2.png",
      content:
          "The large screen real estate allows me to multitask effortlessly and boost my ego",
      postType: 2,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Jacob Jones",
      image: "assets/images/post2.png",
      content:
          "The large screen real estate allows me to multitask effortlessly and boost my ego",
      postType: 2,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Olajide Timothy",
      image: "assets/images/post2.png",
      content:
          "The large screen real estate allows me to multitask effortlessly and boost my ego",
      postType: 3,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Bustin Tunde",
      image: "assets/images/post2.png",
      content:
          "The large screen real estate allows me to multitask effortlessly and boost my ego",
      postType: 1,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Boss Chris",
      image: "assets/images/post2.png",
      content:
          "The large screen real estate allows me to multitask effortlessly and boost my ego",
      postType: 3,
      likes: 12346576,
      dislikes: 123,
      comment: 1234)
].obs;

RxList<PostsData> searchgridList = [
  PostsData(
      name: "Entertainment",
      image: "assets/images/Search/search9.png",
      content: "",
      postType: 1,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Workout",
      image: "assets/images/Search/search1.png",
      content: "",
      postType: 2,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Music",
      image: "assets/images/Search/search2.png",
      content: "",
      postType: 2,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Education",
      image: "assets/images/Search/search3.png",
      content: "",
      postType: 2,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Health",
      image: "assets/images/Search/search4.png",
      content: "",
      postType: 2,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Financial market",
      image: "assets/images/Search/search5.png",
      content: "",
      postType: 2,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Investment",
      image: "assets/images/Search/search6.png",
      content: "",
      postType: 3,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Power",
      image: "assets/images/Search/search7.png",
      content: "",
      postType: 1,
      likes: 12346576,
      dislikes: 123,
      comment: 1234),
  PostsData(
      name: "Movies",
      image: "assets/images/Search/search8.png",
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

// Games Model
RxList<GamesModel> gameslist = [
  GamesModel(
      image: "assets/images/Earn/games.png",
      description: "Complete the task to earn more gold"),
  GamesModel(
      image: "assets/images/Earn/games5.png",
      description: "Complete the task to earn more gold"),
  GamesModel(
      image: "assets/images/Earn/games3.png",
      description: "Complete the task to earn more gold"),
  GamesModel(
      image: "assets/images/Earn/games4.png",
      description: "Spin and earn amazing rewards")
].obs;
