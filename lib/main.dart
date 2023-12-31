import 'package:cardenal_devs/pages/login/login_view.dart';
import 'package:cardenal_devs/pages/menu/main_menu.dart';
import 'package:cardenal_devs/pages/profile/profile_view.dart';
import 'package:cardenal_devs/pages/profile/share/share_view.dart';
import 'package:cardenal_devs/pages/test/test_firebase_auth.dart';
import 'package:cardenal_devs/pages/register/register_view.dart';
import 'package:cardenal_devs/pages/forgot_password/forgot_passwors_view.dart';
import 'package:cardenal_devs/pages/panel_principal/panel_principal_view.dart';
import 'package:cardenal_devs/pages/profile/profile_view.dart';
import 'package:cardenal_devs/pages/panel_principal/cards/card_view.dart';
import 'package:cardenal_devs/pages/panel_principal/cards/uploadCards/upload_view.dart';
import 'package:cardenal_devs/pages/profile/Plagio/plagio_view.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Elimina la etiqueta de debug
      title: 'Recuperación Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(), //CAMBIAR POR LoginPage
      routes: {
        '/login': (context) => LoginPage(),  // Ruta para la página de login
        '/register': (context) => RegisterPage(),  // Ruta para la página de registro
        '/forgot_password': (context) => RecoveryPage(),  // Ruta para la página de recuperación de contraseña
        '/home': (context) => MyHomePage(),
        '/profile': (context) => ProfilePage(),
        '/card': (context) => CardView(),
        '/upload': (context) => FormularioView(),
        //'/plagio': (context) => PlagioView(),
        '/main': (context) => MainMenu(),
        '/profile': (context) => ProfilePage(),

        '/plagio': (context) => PlagioView(),
      },
    );
  }
}

