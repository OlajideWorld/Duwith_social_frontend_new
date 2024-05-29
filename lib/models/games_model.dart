class GamesModel {
  final String image;
  final String description;

  GamesModel({required this.image, required this.description});
}

class ShopModels {
  final String image;
  final String name;
  final String amount;
  final bool isBig;

  ShopModels({
    required this.name,
    required this.image,
    required this.amount,
    required this.isBig,
  });
}
