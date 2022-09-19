class MobileBanking {
  String imgUrl;
  double height;
  double width;

  MobileBanking(
    this.imgUrl,
    this.height,
    this.width,
  );

  static List<MobileBanking> generateItem() {
    return [
      MobileBanking("assets/bKash_logo.png", 180, 180),
      MobileBanking("assets/Nagad_logo.png", 180, 180),
      MobileBanking("assets/Rocket_logo.png", 180, 180),
      MobileBanking("assets/bKash_logo.png", 180, 180),
      MobileBanking("assets/bKash_logo.png", 180, 180),
      MobileBanking("assets/bKash_logo.png", 180, 180),
      MobileBanking("assets/bKash_logo.png", 180, 180),
    ];
  }
}
