import 'package:hotelino/features/home/data/models/hotel.dart';
import 'package:hotelino/shared/services/json_data_servis.dart';

class HotelRepository {
  final JsonDataServis jsonDataServis;

  HotelRepository({required this.jsonDataServis});

  Future<List<Hotel>> fetchHotels() async {
    return jsonDataServis.loadHotel();
  }

  Future<Hotel> getHotelById(String id) {
    return jsonDataServis.loadHotel().then((hotels) {
      return hotels.firstWhere((hotel) => hotel.id == id);
    });
  }
}
