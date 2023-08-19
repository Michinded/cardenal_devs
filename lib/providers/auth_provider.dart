import 'package:firebase_auth/firebase_auth.dart';

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
      errorMessage = error.hashCode as String?;
    }

    if(errorMessage != null){
      //return Future.error(errorMessage); // Regresa el error en caso de que exista
      return false; // Regresa false en caso de que no exista el usuario exista
    }
    return true; // Regresa true en caso de que el usuario exista

  }

}