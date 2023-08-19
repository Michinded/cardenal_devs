import 'package:flutter/material.dart';
import 'package:cardenal_devs/providers/auth_provider.dart';

class LoginController {
  BuildContext ? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future init (BuildContext context) async{
    this.context = context;
  }

  void login() async{
    String _email = emailController.text;
    String _password = passwordController.text;
    try{
      bool isLogged = await AuthProvider().login(_email, _password);
      if(isLogged){
        print("Inicio de sesión exitoso");
      }else{
        print("Error al iniciar sesión");
      }
    }catch(error){
      print(error);
    }

  }
}