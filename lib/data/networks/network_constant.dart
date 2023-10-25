class NetworkConstant {
  static const int kPageSize = 8;
  static const String kPageSizeParam = 'paginate';
  static const String kPageNumberParam = 'page';
  static const int kPageNumberValue = 1;

  static const _kDevBaseUrl = 'http://192.168.1.130:8000/api/';
  static const _kReleaseBaseUrl = 'http://nour-eink.brainshowad.com/api/';
  static const kAppleStoreUrl = '';
  static const kGooglePlayUrl = '';
  static const kAndroidPackage = '';
  static const kAppleId = '';
  static const kAuthorizationHeader = "authorization";
  static const kBaseUrl = _kReleaseBaseUrl;
  static const kGoogleApiKey = 'AIzaSyBZFRav3jNg1pH9RAQxO1IhOGb7keLaoDM';

  static const kTestToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiM2NkZTlmNGFmYjVkNjRlODQ3NDVhMmJhZDljZTY5MGFmYjhjODNlNDY5N2ZjNjA0M2ZmYjVhYWYyMTQ3MTliYTBiNmQ3OTBmNGZlOGVjYTciLCJpYXQiOjE2OTYxNjM2NzkuODAzNDAzLCJuYmYiOjE2OTYxNjM2NzkuODAzNDA2LCJleHAiOjE3Mjc3ODYwNzkuNzIzNDY5LCJzdWIiOiIyMyIsInNjb3BlcyI6W119.FRTGRb5QxgmRXMSBwVkxJBTppjb1UHGuf0NqDpwN9wa4TGIs6u5S2GaCPtuxiUoX_MJwu6QXQbykE9li8Q7AF7EkdS1XvwCtlDVm56n5KOARYERA3N-ELWlA5kkqvV1eKYn6diqlirLSzQigvWUvTPTR_1yGctbxbV1AY0VHIHZoljqXkJHE_eFBAgSZvsaLVm9zC2lLWhtymBtrDJEuiStczMfhIOvidBp098x0yB03n56UF5rAS8IvPKeUUC9cT-dUcHOhNsnbKk4MLA54njZFluh3VjTd76qDIduEr-y9Kbjvh9AEkQF-W8QFkDDYxxGU35_4MGSqqsbTTtwcUJugPRNGB1rVxjFr7kbpSql2OgcBdEwu8gurcspSx_ReUKJGdN-NP2nBN1f9S8meDjqoHS9okZnaW6b8SCD6WxSHz3h7CmS4H-kYb11ixlYHwPmH1CdOVBn1P0xx-H3kyWNkbYAbzCL7gkgdLJa-dX7zfLb8BdtKmSDG86mfaDcGL0wmygShalV7_2FLESEKe1GSjb0LG_ZmLSUCQkWSk0WNorgYU21P-aSFDuSRvLgmh-cpR3yYCuvNOuKAm-Sr28Uv37Q98k2JBxf8trUwYaI62168_diV9R4XObv1sauCk2QylFYNfa77Oh6d4zEmxK9ot2P19ehU6vCuIdt_jBo';

  static String tokenBuilder(String token) => 'Bearer $token';

  static const String kHomeRequest = "home";
  static const String kLoginRequest = "login";
  static const String kSocialLoginRequest = "social-login";
  static const String kRegisterRequest = "register";
  static const String kSearchRequest = "general-search";
  static const String kSendOtp = "send-otp";
  static const String kVerify = "verify";
  static const String kLoginOtp = "login-otp";
  static const String kWallet = "wallet";
  static const String kOrder = "orders";
  static const String kRechargeWallet = "recharge-wallet";
  static const String kCheckOtp = "check-otp";
  static const String kChangePassword = "change-password";
  static const String kUpdateInfo = "users/update-info";
  static const String kUpdatePassword = "users/update-password";
  static const String kCountries = "countries";
  static const String kGeneral = "general";
  static const String kRewards = "rewards";
  static const String kHome = "home";
  static const String kProduct = "product";
  static const String kRank = "rank";
  static const String kRequestReward = "request-reward";
  static const String kCategories = "categories";
  static const String kProducts = "products";
  static const String kDirectPay = "$kOrder/direct-pay";
  static const String kCheckout = "$kOrder/checkout";
  static const String kNotifications = "notifications";
  static const String kMarkAllAsRead = "$kNotifications/mark-all-as-read";
}
