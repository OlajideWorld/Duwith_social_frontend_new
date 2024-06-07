import 'package:get/get.dart';

import '../models/games_model.dart';
import '../models/post-data.dart';
import '../models/transaction_history.dart';

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

RxList<PostsData> searchgridList = [
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

// Shopping models
RxList<ShopModels> dogsList = [
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/dog.png",
      amount: "120",
      isBig: true),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/dog2.png",
      amount: "120",
      isBig: false),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/dog3.png",
      amount: "120",
      isBig: false),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/dog4.png",
      amount: "120",
      isBig: true),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/dog5.png",
      amount: "120",
      isBig: true),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/dog6.png",
      amount: "120",
      isBig: false),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/dog7.png",
      amount: "120",
      isBig: true)
].obs;

RxList<ShopModels> jarList = [
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/jar.png",
      amount: "120",
      isBig: false),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/jar2.png",
      amount: "120",
      isBig: true),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/jar3.png",
      amount: "120",
      isBig: false),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/jar3.png",
      amount: "120",
      isBig: true),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/jar2.png",
      amount: "120",
      isBig: true),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/jar.png",
      amount: "120",
      isBig: false),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/jar2.png",
      amount: "120",
      isBig: false)
].obs;

RxList<ShopModels> boxList = [
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/chest.png",
      amount: "120",
      isBig: false),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/chest2.png",
      amount: "120",
      isBig: true),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/chest3.png",
      amount: "120",
      isBig: false),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/chest4.png",
      amount: "120",
      isBig: false),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/chest2.png",
      amount: "120",
      isBig: true),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/chest.png",
      amount: "120",
      isBig: true),
  ShopModels(
      name: "GrandMaster",
      image: "assets/images/Shop/chest2.png",
      amount: "120",
      isBig: false)
].obs;
