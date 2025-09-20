import 'package:flutter/material.dart';
import 'package:hotelino/core/theme/app_theme.dart';
import 'package:hotelino/core/theme/theme_provider.dart';
import 'package:hotelino/routes/app_route.dart';
import 'package:provider/provider.dart';

void main() {
  final widghetBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(
            WidgetsBinding.instance.platformDispatcher.platformBrightness,
          ),
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
