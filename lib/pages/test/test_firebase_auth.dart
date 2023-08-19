import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBase extends StatefulWidget {
  const AuthBase({super.key});

  @override
  State<AuthBase> createState() => _AuthBaseState();
}

class _AuthBaseState extends State<AuthBase> {

  String _email = "";
  String _password = "";
  String _sesionExitosa = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      if (userCredential.user != null) {
        print('Inicio de sesión exitoso');
        setState(() {
          _sesionExitosa = "Has iniciado sesión";
        });
        // Navegar a la siguiente pantalla después de iniciar sesión
      }
    } catch (e) {
      print('Error al iniciar sesión: $e');
      setState(() {
        _sesionExitosa = "Error al iniciar sesión";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AuthBase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _sesionExitosa,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              decoration: InputDecoration(labelText: 'Correo electrónico'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }

  /*
  String _username = "juanperez@correo.com";
  String _password = "contraseña123waos";
  String _SesionExitosa = "Has iniciado sesión";
  Future<void> _login() async {
    String username = _username;
    String password = _password;

    // Simplemente compara los datos de prueba con los datos ingresados
    if (username == "juanperez@correo.com" && password == "contraseña123waos") {
      // Iniciar sesión en Firebase con un usuario ficticio
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();

      if (userCredential.user != null) {
        print('Inicio de sesión exitoso');
        // Navegar a la siguiente pantalla después de iniciar sesión
      } else {
        print('Error al iniciar sesión');
        _SesionExitosa = "Error al iniciar sesión";
      }
    } else {
      print('Credenciales incorrectas');
      _SesionExitosa = "Credenciales incorrectas";
    }
  }
  @override
  Widget build(BuildContext context) {
    // retornar una pantalla con el valor de la varibale _SesionExitosa
    return Scaffold(
      appBar: AppBar(
        title: Text('AuthBase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _SesionExitosa,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
  */
}
