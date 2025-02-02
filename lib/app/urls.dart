class Urls {
  static const String _baseUrl = 'https://ecommerce-api.codesilicon.com/api';

  static String verifiyEmailUrl(String email) => '$_baseUrl/UserLogin/$email';
  static String verifiyOtplUrl(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String readProfile = '$_baseUrl/ReadProfile';
  static String bannerListUrl = '$_baseUrl/ListProductSlider';
  static String categoryListUrl = '$_baseUrl/CategoryList';
  static String productLisbyRemarktUrl(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';

  static String productLisbyCategoryUrl(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String productDetaitls(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';
}
