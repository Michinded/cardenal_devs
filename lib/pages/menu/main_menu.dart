import 'package:cardenal_devs/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  static const Color color_primary = Color(0xFF0048ad);
  late AuthProvider _authProvider;

  @override
  void initState() {
    super.initState();
    _authProvider = AuthProvider();
    // Usar addPostFrameCallback para llamar a checkLoggedInStatus después de que el widget haya sido construido
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLoggedInStatus();
    });
  }

  // Método para verificar si ya hay una sesión iniciada
  Future<void> checkLoggedInStatus() async {
    if (mounted && _authProvider.getCurrentUser() != null) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0048ad),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/background_app.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/img/logos/logo_qro_dig.png"),
              ),
              const SizedBox(height: 20),
              const Text(
                "¡Bienvenido a EduVerseQ!",
                style: TextStyle(
                  color: color_primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement login functionality
                  Navigator.pushNamed(context, '/login');
                },
                child: Text("Iniciar sesión"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text("Registrarse"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
