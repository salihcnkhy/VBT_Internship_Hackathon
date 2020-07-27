class StringConstanst {
  static StringConstanst _instance;
  static StringConstanst get instance {
    if (_instance == null) _instance = StringConstanst._init();
    return _instance;
  }

  StringConstanst._init();

  // ONBOARDING REGION
  String get onboardingPageOneTitle => "Oyuna Bağlan";
  String get onboardingPageTwoTitle => "Kelimeyi Bul";
  String get onboardingPageThreeTitle => "Rozetleri Kap";

  String get onboardingPageOneSubtitle =>
      "Dünyanın herhangi bir yerindeki çevrimiçi oyuncularla birlikte eşleş.";
  String get onboardingPageTwoSubtitle =>
      "Eşleştikten sonra ekranda çıkan kelimeyi daha önce tahmin etmeye çalış.";
  String get onboardingPageThreeSubtitle => "Kelimeleri bil, rozetleri kap ve yeni bölümleri aç.";

  String get next => "Devam";
  String get done => "Tamamla";
  // ONBOARDING REGION #

  // AUTH REGION
  String get register => "Kayıt ol";
  String get login => "Giriş yap";

  String get emailAddress => "Email adresi";
  String get password => "Parola";

  String get signInWithGithub => "Github ile giriş yap";
  String get signUpWithGithub => "Github ile kayıt ol";
  // AUTH REGION #

}
