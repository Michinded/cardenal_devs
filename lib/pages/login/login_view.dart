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
  LoginController _con = new LoginController();
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
      body: SingleChildScrollView(
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
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Esta es tu app para estudiar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: _con.emailController,
                    decoration: const InputDecoration(
                      labelText: "Correo electrónico",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _con.passwordController,
                    style: const TextStyle(color: Colors.white),
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      labelText: "Contraseña",
                      labelStyle:  const TextStyle(color: Colors.white),
                      enabledBorder:  const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        child: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
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

                    },
                    child: const Text("¿No tienes cuenta? Regitrarse"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

