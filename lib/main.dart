import 'package:flutter/material.dart';

import 'package:preferenciasusuario/src/pages/home_page.dart';
import 'package:preferenciasusuario/src/pages/settings_page.dart';
import 'package:preferenciasusuario/src/share_prefs/preferencias_usuario.dart';

 
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs(); 
  
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget { 


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias App',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName      : (BuildContext context) => HomePage(),
        SettingsPage.routeName  : (BuildContext context) => SettingsPage(),
      },
    );
  }
}