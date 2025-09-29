import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/models/hotel.dart';
import 'package:hotelino/features/home/data/models/profile.dart';
import 'package:hotelino/features/home/data/repositories/hotel_repository.dart';
import 'package:hotelino/features/home/data/repositories/profile_repository.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _profileRepository;
  final HotelRepository _hotelRepository;
  ProfileProvider(this._profileRepository, this._hotelRepository) {
    fetchHotel();
    loadUser();
  }

  Profile? _profile;
  List<Hotel> _hotel = [];
  Profile? get profile => _profile;

  fetchHotel() async {
    _hotel = await _hotelRepository.fetchHotels();
  }

  loadUser() async {
    _profile = await _profileRepository.fetchprofile();
    notifyListeners();
  }

  // ----------------------------Recently viwe hotels--------------------------------------

  final List<String> _recentlyViweHotels = [];

  List<Hotel> get recentlyViweHotels =>
      _hotel.where((hotel) => _recentlyViweHotels.contains(hotel.id)).toList();

  void addRecentlyViweHotels(String hotelId) {
    if (!recentlyViweHotels.contains(hotelId)) {
      _recentlyViweHotels.add(hotelId);
      notifyListeners();
    } else {
      _recentlyViweHotels.remove(hotelId);
      _recentlyViweHotels.add(hotelId);
      notifyListeners();
    }
  }
}
