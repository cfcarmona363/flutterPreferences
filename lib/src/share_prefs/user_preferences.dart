import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instancia = new UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get genero {
    return _prefs.getInt('gender') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('gender', value);
  }

  get colorSecundario {
    return _prefs.getBool('color') ?? true;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('color', value);
  }

  get nombre {
    return _prefs.getString('name') ?? 'Francisco';
  }

  set nombre(String value) {
    _prefs.setString('name', value);
  }

  get lastPage {
    return _prefs.getString('lastPage') ?? 'home';
  }

  set lastPage(String value) {
    _prefs.setString('lastPage', value);
  }
}
