import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BookingData {
  String fullName;
  String destination;
  JalaliRange? checkInOutRageDate;
  String numberOfGuests;
  String phoneNumber;

  BookingData({
    this.fullName = '',
    this.destination = '',
    this.checkInOutRageDate,
    this.numberOfGuests = '',
    this.phoneNumber = '',
  });
}
