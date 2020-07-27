class ImageConstants {
  static ImageConstants _instance;
  static ImageConstants get instance {
    if (_instance == null) _instance = ImageConstants._init();
    return _instance;
  }

  ImageConstants._init();

  String get onboardingPageOneSVG => "assets/svg/world_wide.svg";
  String get onboardingPageTwoSVG => "assets/svg/word.svg";
  String get onboardingPageThreeSVG => "assets/svg/winners.svg";
}
