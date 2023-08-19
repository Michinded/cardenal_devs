import 'package:flutter/material.dart';
import 'package:cardenal_devs/providers/auth_provider.dart';

class RegisterController{
  BuildContext? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future init(BuildContext context) async {
    this.context = context;
  }

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


  void register() async {
    String _email = emailController.text;
    String _password = passwordController.text;
    String _confirmPassword = confirmPasswordController.text;

    if (_password == _confirmPassword) {
      try {
        // Se crea el usuario con el email y el password
        await AuthProvider().getFirebaseAuth().createUserWithEmailAndPassword(email: _email, password: _password);
        _showSnackBar("Usuario creado correctamente");
        Navigator.pushNamed(context!, '/login');
      } catch (error) {
        // Obtener el código de error y saber que tipo de error es
        String errorCode = error.toString();
        if (errorCode.contains("email-already-in-use")) {
          _showSnackBar("El correo electrónico ya está en uso");
        } else {
          _showSnackBar("Error al crear el usuario o ya esta en uso el correo, verifique sus datos");
        }
      }
    }
  }


}