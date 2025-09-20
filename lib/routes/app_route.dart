import 'package:flutter/material.dart';
import 'package:hotelino/features/home/homepage.dart';
import 'package:hotelino/features/onboarding/onBoardingPage.dart';

class AppRoute {
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String bookingForm = '/booking-form';
  static const String hotelDetail = '/hotel-detail';
  static const String favorite = '/favorite';
  static const String profile = '/profile';

  static final Map<String, WidgetBuilder> route = {
    onboarding: (ctx) => const OnboardingPage(),
    home: (ctx) => const HomeScreen(),
  };
}
