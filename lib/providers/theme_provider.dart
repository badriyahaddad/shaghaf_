import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

//What is it: provider theme to change rom light to dark and the opposite
class ThemeProvider with ChangeNotifier {
  bool isDark = false;

  switchMode() {
    isDark = !isDark;
    saveData();
    //every change must be notified to the main root and injected into the whole app in provider
    notifyListeners();
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
    setTheme();
  }

//set the theme through get theme
  setTheme() {
    getTheme();
  }

//get theme to get
  getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('isDark') ?? false;
    notifyListeners();
  }
}
