import 'package:cardenal_devs/pages/login/login_view.dart';
import 'package:cardenal_devs/pages/register/register_view.dart';
import 'package:cardenal_devs/pages/forgot_password/forgot_passwors_view.dart';
import 'package:cardenal_devs/pages/panel_principal/panel_principal_view.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recuperación Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),  // Ruta para la página de login
        '/register': (context) => RegisterPage(),  // Ruta para la página de registro
        '/forgot_password': (context) => RecoveryPage(),  // Ruta para la página de recuperación de contraseña
        '/home': (context) => MyHomePage(),

      },
    );
  }
}

