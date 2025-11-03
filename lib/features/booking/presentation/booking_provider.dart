import 'package:flutter/widgets.dart';
import 'package:hotelino/features/booking/data/booking_data.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BookingProvider with ChangeNotifier {
  final BookingData _booking = BookingData();
  BookingData get booking => _booking;

  void setFullName(String value) {
    _booking.fullName = value;
    notifyListeners();
  }

  void setDestination(String value) {
    _booking.destination = value;
    notifyListeners();
  }

  void setNumberOfGuests(String value) {
    _booking.numberOfGuests = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _booking.phoneNumber = value;
    notifyListeners();
  }

  void setRangeDate(JalaliRange value) {
    _booking.checkInOutRageDate = value;
    notifyListeners();
  }
}
