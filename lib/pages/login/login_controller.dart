import 'package:flutter/material.dart';
import 'package:cardenal_devs/providers/auth_provider.dart';

class LoginController extends StatefulWidget {
  const LoginController({super.key});

  @override
  State<LoginController> createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {

  String _email = "juanperez@correo.com";
  String _password = "contraseña123waos";
  String _sesionExitosa = "";
  /*
  void login() async{
    try{
      bool isLogged = await AuthProvider().login(_email, _password);
      if (isLogged) {
        setState(() {
          _sesionExitosa = "Has iniciado sesión";
        });
      } else {
        setState(() {
          _sesionExitosa = "Error al iniciar sesión";
        });
      }
    }catch(error){
      _sesionExitosa = error.toString();
    }
  }
   */

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
            ElevatedButton(
              onPressed: () {
                //login();
              },
              child: Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
