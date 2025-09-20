import 'package:flutter/material.dart';
import 'package:hotelino/core/theme/app_theme.dart';
import 'package:hotelino/core/theme/theme_provider.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeModeChainge, child) {
        return MaterialApp(
          theme: themeModeChainge.brightness == Brightness.dark
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
          home: Scaffold(
            appBar: AppBar(),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  themeModeChainge.toggleTheme();
                },
                child: Text('chainge theme'),
              ),
            ),
          ),
        );
      },
    );
  }
}
