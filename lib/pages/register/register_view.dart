import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _showPassword = false;
  String? _selectedCarrera;
  final List<String> _carreras = [
    'Ingeniería en Sistemas',
    'Ingeniería Civil',
    'Medicina',
    // Agrega las carreras que necesites
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0048ad),
      body: SingleChildScrollView(
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
                  color: Colors.white,
                ),
              ),
              const Text(
                'Esta es tu app para estudiar',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Nombre',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
               TextField(

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
                  hintText: "Selecciona tu carrera",
                ),

                items: _carreras.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCarrera = newValue;
                  });
                },
                value: _selectedCarrera,
              ),
              const SizedBox(height: 10.0),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Ingresa tu generación',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Ingresa tu correo y/o matrícula',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
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
              SizedBox(height: 10.0),
              TextField(
                obscureText: !_showPassword,
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
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Acción del botón
                },
                child: Text('Registrarse'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('¿Ya tienes cuenta?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
