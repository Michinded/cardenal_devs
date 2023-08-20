import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cardenal_devs/providers/auth_provider.dart';

class LoginController {
  BuildContext ? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future init (BuildContext context) async{
    this.context = context;
  }

  // Método para mostrar un SnackBar
  // Muestra un mensaje en la parte inferior de la pantalla por 3 segundos
  void _showSnackBar(String message) {
    if (context != null) {
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          backgroundColor: const Color(0xFFF78044), // Background color
          elevation: 8, // Shadow level
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
        ),
      );
    }
  }

  void login() async{
    String _email = emailController.text;
    String _password = passwordController.text;
    try{
      bool isLogged = await AuthProvider().login(_email, _password);
      if(isLogged){
        // Obtiene el usuario actual de AuthProvider

        User ? user = AuthProvider().getCurrentUser();

        user!.sendEmailVerification();

        if (user!.emailVerified) {
          _showSnackBar("Bienvenido: ${user.email!}");
          Navigator.pushNamed(context!, '/home');
        } else {
          _showSnackBar("Por favor verifica tu correo electrónico, te hemos enviado un correo de verificación");
        }
      }else{
        _showSnackBar("Error al iniciar sesión, verifique sus datos");
      }
    }catch(error){
      // Obtener el código de error y saber que tipo de error es
      //String errorCode = error.toString();
      _showSnackBar("Error al iniciar sesión, verifique sus datos");
      print(error);
    }

  }
}