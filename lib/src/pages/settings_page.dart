import 'package:flutter/material.dart';
import 'package:preferences/src/share_prefs/user_preferences.dart';
import 'package:preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textController;
  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    _textController = new TextEditingController(text: _nombre);
  }

  _setSelectedRadio(int value) {
    prefs.genero = value;
    _genero = value;
    setState(() {});
  }

  _changeSwitch(bool value) {
    prefs.colorSecundario = value;
    _colorSecundario = value;
    setState(() {});
  }

  _inputChange(String value) {
    prefs.nombre = value;
    _nombre = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: Text('Secondary color'),
                onChanged: _changeSwitch),
            RadioListTile(
              value: 1,
              title: Text('Male'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Female'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Name', helperText: 'Users name'),
                onChanged: _inputChange,
              ),
            )
          ],
        ));
  }
}
