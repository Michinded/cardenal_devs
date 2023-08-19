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
              CircleAvatar(
                // Aquí puedes poner la imagen de tu logo, solo es un ejemplo
                backgroundImage: AssetImage('path/to/your/logo.png'),
                radius: 50.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Regístrate',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              Text(
                'Esta es tu app para estudiar',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Nombre',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Apellidos',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField(
                hint: Text('Selecciona tu carrera'),
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
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Ingresa tu generación',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 10.0),
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
