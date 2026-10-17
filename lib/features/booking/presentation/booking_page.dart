import 'package:flutter/material.dart';
import 'package:hotelino/features/booking/presentation/booking_provider.dart';
import 'package:hotelino/features/booking/presentation/widgets/booking_form_field.dart';
import 'package:hotelino/features/booking/presentation/widgets/date_picker_field.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  void resetForm() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _formKey.currentState?.reset();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'فرم رزو هتل',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Consumer<BookingProvider>(
            builder: (context, bookingProvider, child) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -------------------Fullname field---------------------
                    BookingFormField(
                      title: 'نام و نام خانوادگی',
                      hint: 'نام و نام خانوادگی خودرا بنویسید...',
                      keyboardType: TextInputType.text,
                      initialValue: bookingProvider.booking.fullName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا نام خود را کامل بنویسید';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setFullName(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    // -----------------Maqsad field-------------------------
                    BookingFormField(
                      title: 'مقصد',
                      hint: 'مقصد خود را بنویسید...',
                      keyboardType: TextInputType.text,
                      initialValue: bookingProvider.booking.destination,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا مقد خودرا به صورت صحیح وارد کنید';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setDestination(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    // ----------------------Date field-----------------------
                    DatePickerField(
                      titel: 'تاریخ اقامت',
                      hint: 'بازه زمانی اقامت را مشخص کنید',
                      initialValue: bookingProvider.booking.checkInOutRageDate,
                      validator: (value) {
                        if (value == null) {
                          return 'لطفا بازه زمانی خود را انتخاب کنید';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setRangeDate(newValue);
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    // -------------------NumberOfGuestes field----------------
                    BookingFormField(
                      title: 'تعداد نفرات',
                      hint: 'تعداد نفرات خود را وارد کنید...',
                      initialValue: bookingProvider.booking.numberOfGuests,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null) {
                          return 'لطفا تعداد نفرات خودرا به صورت صحیح وارد کنید';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          bookingProvider.setNumberOfGuests(newValue);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
