class MobileBanking {
  String imgUrl;
  double height;
  double width;
  String label;

  MobileBanking(this.imgUrl, this.height, this.width, this.label);

  static List<MobileBanking> generateItem() {
    return [
      MobileBanking("assets/bKash_logo.png", 200, 200, "bKash NUmber"),
      MobileBanking("assets/Nagad_logo.png", 180, 180, "Nagad Number"),
      MobileBanking("assets/Group 197.png", 180, 180, "Rocket Number"),
      MobileBanking("assets/Upai.png", 180, 180, "Upai Number"),
      MobileBanking("assets/tap.png", 180, 180, "tap Number"),
      MobileBanking("assets/Group 196.png", 180, 180, "M Cash Number"),
      MobileBanking("assets/Group-271.png", 180, 180, "SureCash Number"),
    ];
  }
}
