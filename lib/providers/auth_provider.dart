import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider{
  late FirebaseAuth _firebaseAuth;
  AuthProvider(){
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<bool> login (String email, String password) async{
    String? errorMessage;
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }catch(error) {
      print(error);
      errorMessage = error.hashCode as String?;
    }

    if(errorMessage != null){
      return Future.error(errorMessage);
    }
    return true;

  }

}