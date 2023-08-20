import 'package:flutter/material.dart';
import 'package:cardenal_devs/providers/auth_provider.dart';

class RegisterController{
  BuildContext? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidosController = TextEditingController();
  TextEditingController carreraController = TextEditingController();
  TextEditingController generacionController = TextEditingController();

  String _selectedCarrera = ''; // Valor inicial del DropdownButtonFormField

  String get carrera => _selectedCarrera;
  set carrera(String newValue) {
    _selectedCarrera = newValue;
    carreraController.text = newValue;
  }

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
    String _nombre = nombreController.text;
    String _apellidos = apellidosController.text;
    String _carrera_end = carrera;
    String _generacion = generacionController.text;

    // Validar que los campos no estén vacíos
    if (_email.isEmpty || _password.isEmpty || _confirmPassword.isEmpty || _nombre.isEmpty || _apellidos.isEmpty || _carrera_end.isEmpty || _generacion.isEmpty) {
      _showSnackBar("Por favor, rellene todos los campos");
      return;
    }

    if (_password == _confirmPassword) {
      print("Las contraseñas coinciden");
      print("Nombre: $_nombre");
      print("Apellidos: $_apellidos");
      print("Carrera: $_carrera_end");
      print("Generación: $_generacion");
      print("email: $_email");
      print("password: $_password");

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
    }else{
      print("Las contraseñas no coinciden");
    }


  }


}