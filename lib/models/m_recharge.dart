class MobileRecharge {
  String imgUrl;
  String label;

  MobileRecharge(this.imgUrl, this.label);

  static List<MobileRecharge> items() {
    return [
      MobileRecharge("assets/m_recharge_image/gp.png", "Mobile Number"),
      MobileRecharge("assets/m_recharge_image/airtel.png", "Mobile Number"),
      MobileRecharge("assets/m_recharge_image/banglalink.png", "Mobile Number"),
      MobileRecharge("assets/m_recharge_image/robi.png", "Mobile Number"),
      MobileRecharge(
          "assets/m_recharge_image/TeleTalk-Logo.png", "Mobile Number")
    ];
  }
}
