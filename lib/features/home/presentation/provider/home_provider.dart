import 'package:flutter/material.dart';
import 'package:hotelino/core/constans/constans.dart';
import 'package:hotelino/features/home/data/models/homepage_data.dart';
import 'package:hotelino/features/home/data/models/hotel.dart';
import 'package:hotelino/features/home/data/repositories/hotel_repository.dart';

class HomeProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;
  HomeProvider(this._hotelRepository) {
    fetchHotels();
  }

  List<Hotel> _hotels = [];
  List<Hotel> get hotels => _hotels;
  final HomepageData _homepageData = HomePageDataConstants.homePageData;
  HomepageData get homepageData => _homepageData;

  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
    notifyListeners();
  }

  // filter methods -----------------------------------------------------------------------

  List<Hotel> getPopularHotels() {
    return _hotels
        .where((hotels) => _homepageData.popular.contains(hotels.id))
        .toList();
  }

  List<Hotel> getSpecialOffersHotels() {
    return _hotels
        .where((hotels) => _homepageData.specialOffers.contains(hotels.id))
        .toList();
  }

  List<Hotel> getNewestHotels() {
    return _hotels
        .where((hotels) => _homepageData.newest.contains(hotels.id))
        .toList();
  }

  // Story Section-------------------------------fake data----------------------------------

  List<String> getStoryImage() {
    final shuffledHotels = List<Hotel>.from(_hotels)..shuffle();
    return shuffledHotels.take(3).map((hotel) => hotel.images[0]).toList();
  }

  final List<String> _storyTitel = [
    "امکانت رفاهی کامل",
    "اقامت در قلب شهر",
    "لوکس ترین هتل ها",
  ];

  List<String> get storyTitel => _storyTitel;
}
