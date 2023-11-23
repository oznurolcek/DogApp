class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance => _instance ??= ImageConstants._init();

  ImageConstants._init();

  //svg
  String get helpIcon => toSvg("ic_help");
  String get rateUsIcon => toSvg("ic_rate");
  String get shareIcon => toSvg("ic_share");
  String get termsIcon => toSvg("ic_terms");
  String get privacyIcon => toSvg("ic_privacy");
  String get versionIcon => toSvg("ic_version");
  String get selectedHomeIcon => toSvg("ic_selected_home");
  String get homeIcon => toSvg("ic_home");
  String get selectedSettingsIcon => toSvg("ic_selected_settings");
  String get settingsIcon => toSvg("ic_settings");

  //png
  String get splashIcon => toPng("ic_splash");

  String toSvg(String name) => "assets/image/$name.svg";
  String toPng(String name) => "assets/image/$name.png";
}