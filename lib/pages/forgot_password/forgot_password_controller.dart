import 'package:cardenal_devs/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class SendRecoverMail{
  BuildContext ? context;

  TextEditingController emailrecoverController = TextEditingController();

  Future init (BuildContext context) async{
    this.context = context;
  }

  void sendEmailRecover() async {
    String _email_recover = emailrecoverController.text;

    try {
      await AuthProvider().getFirebaseAuth().sendPasswordResetEmail(email: _email_recover);
      _showSnackBar("Se ha enviado un correo de recuperación a: $_email_recover");
    } catch (error) {
        _showSnackBar("Error al enviar el correo de recuperación, por favor verifique sus datos");
    }
  }


  void _showSnackBar(String message) {
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