import 'package:flutter/material.dart';
import 'package:preferences/src/share_prefs/user_preferences.dart';
import 'package:preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary color: ${prefs.colorSecundario}'),
          Divider(),
          Text('Gender: ${prefs.genero}'),
          Divider(),
          Text('User name: ${prefs.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}
