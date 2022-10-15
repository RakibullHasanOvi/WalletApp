class MobileBanking {
  String imgUrl;
  double height;
  double width;
  String label;

  MobileBanking(this.imgUrl, this.height, this.width, this.label);

  static List<MobileBanking> generateItem() {
    return [
      // MobileBanking(
      //     "images/m_banking_image/bKash.svg", 108, 108, "bKash Number"),
      MobileBanking("assets/bKash_logo.png", 108, 108, "bKash NUmber"),
      MobileBanking("assets/Nagad_logo.png", 108, 108, "Nagad Number"),
      MobileBanking("assets/Group 197.png", 108, 108, "Rocket Number"),
      MobileBanking("assets/Upai.png", 108, 108, "Upai Number"),
      MobileBanking("assets/tap.png", 108, 108, "tap Number"),
      MobileBanking("assets/Group 196.png", 108, 108, "M Cash Number"),
      MobileBanking("assets/Group-271.png", 108, 108, "SureCash Number"),
    ];
  }
}
