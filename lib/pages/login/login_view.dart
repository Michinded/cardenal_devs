import 'package:cardenal_devs/pages/login/login_controller_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  final LoginController _con = LoginController();
  static const Color color_primary = Color(0xFF0048ad);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("INIT STATES");
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      print("SCREEN INIT");
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0048ad),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0048ad),
        elevation: 0,
        title: const Text('Iniciar sesión'),
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
          child: Column(
            children: [
              const SizedBox(height: 80),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/img/logos/logo_qro_dig.png"), // Ruta de la imagen
              ),
              const SizedBox(height: 20),
              const Text(
                "¡Bienvenido!",
                style: TextStyle(
                  color: color_primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Esta es tu app para estudiar",
                style: TextStyle(
                  color: color_primary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: _con.emailController,
                      decoration: const InputDecoration(
                        hintText: 'Correo electrónico',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _con.login();
                      },
                      child: const Text("Iniciar sesión"),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text("¿No tienes cuenta?"),
                    ),
                    const SizedBox(height: 0),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot_password');
                      },
                      child: const Text("¿Se te olvidó tu contraseña?"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}

