import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Esta clase se encarga de la autenticación de los usuarios a través de Firebase Auth

class AuthProvider{
  // Se crea una instancia de FirebaseAuth
  late FirebaseAuth _firebaseAuth;
  AuthProvider(){
    _firebaseAuth = FirebaseAuth.instance;
  }
  // Se crea el método login que recibe como parámetros el email y el password
  Future<bool> login (String email, String password) async{
    String? errorMessage;
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }catch(error) {
     // print(error); // Imprime el error en la consola de debug
      //errorMessage = error.hashCode as String?;
      // Si el error contiene We have blocked all requests from this device due to unusual activity
      // se muestra el mensaje de error correspondiente
      /*if(errorMessage!.contains("We have blocked all requests from this device due to unusual activity")){
        errorMessage = "Se han realizado demasiados intentos de iniicio, por favor intenta más tarde, reinicia la app o recupera tu contraseña";
      }
       */
      return false;
    }

    if(errorMessage != null){
      //return Future.error(errorMessage); // Regresa el error en caso de que exista
      return false; // Regresa false en caso de que no exista el usuario exista
    }
    return true; // Regresa true en caso de que el usuario exista

  }

  // Método para recuperar el usuario actual
  User? getCurrentUser(){
    return _firebaseAuth.currentUser;
  }

  // Método para devolver un FirebaseAuth
  FirebaseAuth getFirebaseAuth(){
    return _firebaseAuth;
  }


  // Método para cerrar sesión
  Future<void> logout() async{
    await _firebaseAuth.signOut();
  }

}