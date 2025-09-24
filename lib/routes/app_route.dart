import 'package:flutter/material.dart';
import 'package:hotelino/features/onboarding/presentation/onboarding_page.dart';
import 'package:hotelino/routes/main_bottom_nav.dart';

class AppRoute {
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String bookingForm = '/booking-form';
  static const String hotelDetail = '/hotel-detail';
  static const String favorite = '/favorite';
  static const String profile = '/profile';

  static final Map<String, WidgetBuilder> route = {
    onboarding: (ctx) => const OnboardingPage(),
    home: (ctx) => const MainBottomNav(),
  };
}
