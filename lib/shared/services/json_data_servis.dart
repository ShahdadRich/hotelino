import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hotelino/core/constans/constans.dart';
import 'package:hotelino/features/home/data/models/hotel.dart';

class JsonDataServis {
  Future<List<Hotel>> loadHotel() async {
    final response = await rootBundle.loadString(AppConstans.hotelsData);
    final Map<String, dynamic> jsonData = jsonDecode(response);
    final List<dynamic> hotelsList = jsonData['hotels'];

    return hotelsList
        .map((hotel) => Hotel.fromJson(hotel as Map<String, dynamic>))
        .toList();
  }
}
