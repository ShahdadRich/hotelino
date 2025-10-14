import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/models/hotel.dart';
import 'package:hotelino/features/home/data/repositories/hotel_repository.dart';

class FavoriteItemProovider extends ChangeNotifier {
  final HotelRepository _hotelRepository;

  FavoriteItemProovider(this._hotelRepository) {
    fetchHotels();
  }

  final List<String> _favoritHotelsIds = [];
  List<Hotel> get favoritHotelsId =>
      _hotels.where((hotel) => _favoritHotelsIds.contains(hotel.id)).toList();

  List<Hotel> _hotels = [];
  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
  }

  bool isFavorite(String hotelId) {
    return _favoritHotelsIds.contains(hotelId);
  }

  void toggelFavoritItem(String hotelId) {
    if (_favoritHotelsIds.contains(hotelId)) {
      _favoritHotelsIds.remove(hotelId);
    } else {
      _favoritHotelsIds.add(hotelId);
    }
  }
}
