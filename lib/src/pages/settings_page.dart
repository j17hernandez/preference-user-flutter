import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = true;
  int _genero = 1;
  String _nombre = 'Jorge';

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _cargarPref();
    _textController = new TextEditingController(text: _nombre);
  }

  _cargarPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genero = prefs.getInt('genero');
    setState(() {});
  }

  _setSelectedRadio(int valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('genero', valor);

    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Settings',
                  style:
                      TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
            ),
            Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: Text('Color secundario'),
                onChanged: (value) {
                  setState(() {
                    _colorSecundario = value;
                  });
                }),
            RadioListTile(
                value: 1,
                title: Text('Masculino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona',
                    suffixIcon: Icon(Icons.accessibility),
                    icon: Icon(Icons.account_circle)),
                onChanged: (value) {},
              ),
            )
          ],
        ));
  }
}
