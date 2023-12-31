import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cardenal_devs/providers/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController{
  BuildContext? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidosController = TextEditingController();
  TextEditingController carreraController = TextEditingController();
  TextEditingController generacionController = TextEditingController();

  //Instancia una conexion a fire store
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

    if (_generacion.contains(RegExp(r'[a-zA-Z]'))) {
      _showSnackBar("El año de generación debe ser numérico");
      return;
    }

    if (_generacion.length > 4 || _generacion.length < 4) {
      _showSnackBar("El año de generación debe tener 4 dígitos");
      return;
    }

    if(_generacion.contains(RegExp(r'[0-9]'))){
      int _generacion_int = int.parse(_generacion);
      // Validar que el año de generación no sea menor o igual al año actual
      if (_generacion_int >= DateTime.now().year) {
        _showSnackBar("El año de generación debe ser menor al año actual");
        return;
      }
    }
    // Retornar si el email no es válido (no contiene @)
    if( !_email.contains("@")){
      _showSnackBar("El correo no es válido");
      return;
    }

    // Validar que el email termine con .edu.mx
    if(_email.endsWith(".edu.mx")){
      if (_password == _confirmPassword) {
        if (_password.length > 7) {
          try {
            // Se crea el usuario con el email y el password
            await AuthProvider()
                .getFirebaseAuth()
                .createUserWithEmailAndPassword(
                email: _email, password: _password);
            // Obtiene el usuario actual de AuthProvider
            User ? user = AuthProvider().getCurrentUser();
            // Se crea un documento en la colección users con el uid del usuario y sus datos
            await _firestore.collection('users').doc(user!.uid).set({
              'nombre': _nombre,
              'apellidos': _apellidos,
              'carrera': _carrera_end,
              'generacion': _generacion,
              'email': _email,
              'uid': user.uid,
            });

            //Envia un correo de verificacion al usuario
            user.sendEmailVerification();

            // Muestra un mensaje de registro exitoso y redirige a la página de login
            _showSnackBar("Registro exitoso");
            Navigator.pushNamed(context!, '/login');
          } catch (error) {
            _showSnackBar(
                "Error al crear el usuario o ya esta en uso el correo, verifique sus datos");
            return;
          }
        } else {
          _showSnackBar("La contraseña debe tener al menos 8 caracteres");
          return;
        }
      } else {
        _showSnackBar("Las contraseñas no coinciden");
        return;
      }
    }else{
      _showSnackBar("El correo debe ser institucional");
      return;
    }


  }


}