import 'package:flutter/material.dart';
import 'package:preferences/src/pages/home_page.dart';
import 'package:preferences/src/pages/settings_page.dart';
import 'package:preferences/src/share_prefs/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new UserPreferences();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Preferences',
        initialRoute: prefs.lastPage,
        routes: {
          HomePage.routeName: (BuildContext context) {
            prefs.lastPage = HomePage.routeName;
            return HomePage();
          },
          SettingsPage.routeName: (BuildContext context) {
            prefs.lastPage = SettingsPage.routeName;
            return SettingsPage();
          }
        });
  }
}
