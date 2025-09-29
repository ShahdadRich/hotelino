// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hotelino/core/theme/app_theme.dart';
import 'package:hotelino/core/theme/theme_provider.dart';
import 'package:hotelino/features/home/data/repositories/hotel_repository.dart';
import 'package:hotelino/features/home/data/repositories/profile_repository.dart';
import 'package:hotelino/features/home/presentation/provider/home_provider.dart';
import 'package:hotelino/features/home/presentation/provider/profile_provider.dart';
import 'package:hotelino/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:hotelino/features/onboarding/presentation/onboarding_provider.dart';
import 'package:hotelino/routes/app_route.dart';
import 'package:hotelino/shared/services/json_data_servis.dart';
import 'package:provider/provider.dart';

void main() {
  final widghetBinding = WidgetsFlutterBinding.ensureInitialized();
  final hoteRepository = HotelRepository(jsonDataServis: JsonDataServis());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(
            WidgetsBinding.instance.platformDispatcher.platformBrightness,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => OnboardingProvider(OnboardingRepository()),
        ),
        ChangeNotifierProvider(create: (_) => HomeProvider(hoteRepository)),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(ProfileRepository(), hoteRepository),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    final britness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).updteBrightness(britness);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeModeChainge, child) {
        return MaterialApp(
          title: 'Hotelino',
          routes: AppRoute.route,
          initialRoute: AppRoute.onboarding,
          theme: themeModeChainge.brightness == Brightness.dark
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
        );
      },
    );
  }
}
