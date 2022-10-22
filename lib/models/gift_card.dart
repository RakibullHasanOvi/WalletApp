class GiftCard {
  String imgUrl;
  String title;
  String subtitle;

  GiftCard(this.imgUrl, this.subtitle, this.title);

  static List<GiftCard> items() {
    return [
      GiftCard(
        'assets/Nagad_logo.png',
        'Enter your e-mail address',
        'Amount',
      ),
      GiftCard(
        'assets/Upai.png',
        'Enter Your e-mail address',
        'Amount',
      ),
    ];
  }
}
