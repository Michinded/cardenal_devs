import 'package:flutter/material.dart';

class RecoveryPage extends StatefulWidget {
  @override
  _RecoveryPageState createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0048ad),
      body: Padding(
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
              'Recupera tu contraseña',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            Text(
              'Ingresa tu correo electrónico',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Ingresa tu correo y/o matrícula',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Acción del botón
              },
              child: Text('Recuperar'),
            ),
          ],
        ),
      ),
    );
  }
}
