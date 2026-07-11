import 'package:easy_localization/easy_localization.dart';

abstract final class AppStrings {
  // Home
  static String get home => 'home'.tr();
  static String get welcomeMessage => 'welcome_message'.tr();
  static String get viewAll => 'view_all'.tr();
  static String get a5bark => 'a5bark'.tr();
  static String get goToHome => 'go_to_home'.tr();

  // Theme
  static String get theme => 'theme'.tr();
  static String get dark => 'dark'.tr();
  static String get light => 'light'.tr();

  // Language
  static String get language => 'language'.tr();
  static String get arabic => 'arabic'.tr();
  static String get english => 'english'.tr();

  // Categories
  static String get general => 'general'.tr();
  static String get business => 'business'.tr();
  static String get sport => 'sport'.tr();
  static String get health => 'health'.tr();
  static String get science => 'science'.tr();
  static String get technology => 'technology'.tr();
  static String get entertainment => 'entertainment'.tr();

  // Search
  static String get search => 'search'.tr();
  static String get searchHint => 'search_hint'.tr();
  static String get searching => 'searching'.tr();

  // States
  static String get noSearchFound => 'no_search_found'.tr();
  static String get noArticles => 'no_articles'.tr();
  static String get noInternet => 'no_internet'.tr();
  static String get somethingWentWrong => 'something_went_wrong'.tr();
  static String get tryAgain => 'try_again'.tr();

  // Article
  static String get emptyAuthorName => 'empty_author_name'.tr();
  static String get viewArticle => 'view_article'.tr();
  static String get noArticleTitle => 'no_article_title'.tr();
  static String get noArticleDescription => 'no_article_description'.tr();
  static String get unknownAuthor => 'unknown_author'.tr();
  static String get publishedDateUnknown => 'published_date_unknown'.tr();
}