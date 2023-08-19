import 'package:cardenal_devs/pages/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RecoveryPage extends StatefulWidget {
  const RecoveryPage({super.key});



  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  final SendRecoverMail _con = SendRecoverMail();
  static const Color color_primary = Color(0xFF0048ad);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0048ad),
        elevation: 0,
        title: const Text('Recuperar contraseña'),
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
                'Recupere su contraseña',
                style: TextStyle(
                  fontSize: 24.0,
                  color: color_primary,
                ),
              ),
              const Text(
                'Ingrese su correo electrónico',
                style: TextStyle(
                  fontSize: 16.0,
                  color: color_primary,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _con.emailrecoverController,
                decoration: const InputDecoration(
                  hintText: 'Correo electrónico',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Acción del botón
                  _con.sendEmailRecover();
                },
                child: const Text('Recuperar'),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

