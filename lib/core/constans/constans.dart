import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/models/homepage_data.dart';

class AppConstans {
  static const String hotelsData = "assets/data/hotels.json";
  static const String baseUrlImage =
      "https://dunijet.ir/content/project/hotelino/";
}

class AppColors {
  static const Color primeryColor = Color(0xffB27258);

  // light theme

  static const Color lightText = Colors.black;
  static const Color lightHint = Color(0xff9196A3);
  static const Color lightInputFill = Color(0xfff5f5f5);
  static const Color lightBorder = Color(0xff9196A3);
  static const Color lightFocusBorder = Colors.brown;

  // dark theme

  static const Color darkText = Colors.white;
  static const Color darkHint = Color(0xff9196A3);
  static const Color darkInputFill = Color(0xff303030);
  static const Color darkBorder = Color(0xff707070);
  static const Color darkFocusBorder = Colors.brown;
  static const Color darkButton = Color(0xff5d4037);
}

class HomePageDataConstants {
  static const List<String> _favoriteHotelIds = ["1", "3", "5", "7"];
  static const List<String> _discountedHotelIds = ["2", "4", "6", "8"];
  static const List<String> _recentlyViewedHotelIds = ["1", "4", "9"];
  static const List<String> _popularHotelIds = ["3", "6", "9", "10"];
  static const List<String> _specialOfferHotelIds = ["5", "7", "10"];
  static const List<String> _newestHotelIds = ["8", "9", "10"];

  static HomepageData get homePageData => HomepageData(
    favorires: _favoriteHotelIds,
    discounted: _discountedHotelIds,
    recentlyViewed: _recentlyViewedHotelIds,
    popular: _popularHotelIds,
    specialOffers: _specialOfferHotelIds,
    newest: _newestHotelIds,
  );
}
