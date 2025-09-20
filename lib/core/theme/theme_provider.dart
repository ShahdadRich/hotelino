import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeProvider extends ChangeNotifier {
  Brightness _brightness;
  ThemeProvider(this._brightness);

  Brightness get brightness => _brightness;

  void updteBrightness(Brightness brightness) {
    _brightness == brightness;
    _updateSysthemUI();
    notifyListeners();
  }

  void toggleTheme() {
    _brightness = (_brightness == Brightness.dark)
        ? Brightness.light
        : Brightness.dark;
    _updateSysthemUI();
    notifyListeners();
  }

  void _updateSysthemUI() {
    bool isDark = _brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: isDark ? Colors.black : Colors.white,
        systemNavigationBarIconBrightness: isDark
            ? Brightness.light
            : Brightness.dark,
      ),
    );
  }
}
