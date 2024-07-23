class GamesModel {
  final String image;
  final String description;

  GamesModel({required this.image, required this.description});
}

class ShopModel {
  String id;
  String shopType;
  String shopItemName;
  String image;
  int amount;
  int shopReward;
  List<dynamic> shopExtraRewards;
  bool isItemBig;

  ShopModel({
    required this.id,
    required this.shopType,
    required this.shopItemName,
    required this.image,
    required this.amount,
    required this.shopReward,
    required this.shopExtraRewards,
    required this.isItemBig,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
        id: json["_id"],
        shopType: json["shopType"],
        shopItemName: json["shopItemName"],
        image: json["image"],
        amount: json["amount"],
        shopReward: json["shopReward"],
        shopExtraRewards:
            List<dynamic>.from(json["shopExtraRewards"].map((x) => x)),
        isItemBig: json["isItemBig"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "shopType": shopType,
        "shopItemName": shopItemName,
        "image": image,
        "amount": amount,
        "shopReward": shopReward,
        "shopExtraRewards": List<dynamic>.from(shopExtraRewards.map((x) => x)),
        "isItemBig": isItemBig,
      };
}
