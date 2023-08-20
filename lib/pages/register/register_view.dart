import 'package:cardenal_devs/pages/register/register_controller.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _showPassword = false;
  String? _selectedCarrera;
  static const Color color_primary = Color(0xFF0048ad);
  final RegisterController _con = RegisterController();
  final List<String> _carreras = [
    'Ingeniería en Sistemas',
    'Ingeniería Civil',
    'Medicina',
    // Agrega las carreras que necesites
  ];

  @override
  void initState() {
    super.initState();
    _con.init(context);
    _con.carrera = _carreras[0]; // Establecer el valor inicial para _selectedCarrera
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0048ad),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0048ad),
        elevation: 0,
        title: const Text('Registrarse'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/background_app.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  // Aquí puedes poner la imagen de tu logo, solo es un ejemplo
                  backgroundImage: AssetImage("assets/img/logos/logo_qro_dig.png"),
                  radius: 50.0,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Regístrate',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: color_primary,
                  ),
                ),
                const Text(
                  'Esta es tu app para estudiar',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: color_primary,
                  ),
                ),
                const SizedBox(height: 20.0),
                 TextField(
                  controller: _con.nombreController,
                  decoration: const InputDecoration(
                    hintText: 'Nombre',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _con.apellidosController,
                  decoration: const InputDecoration(
                    hintText: 'Apellidos',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: "Seleccione su carrera",
                  ),
                  items: _carreras.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _con.carrera = newValue!; // Actualiza el valor en el controlador
                    });
                  },
                  value: _con.carrera,
                ),
                const SizedBox(height: 10.0),
                 TextField(
                  controller: _con.generacionController,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su generación',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _con.emailController,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese su correo electrónico',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _con.passwordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  obscureText: !_showPassword,
                  controller: _con.confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Confirmar contraseña',
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Acción del botón
                    _con.register();
                  },
                  child: const Text('Registrarse'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('¿Ya tienes cuenta?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}