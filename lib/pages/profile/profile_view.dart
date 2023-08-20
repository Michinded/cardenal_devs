import 'package:cardenal_devs/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:cardenal_devs/providers/auth_provider.dart';
import 'share/share_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final profileData = await InfoProfile().getInfoUser();
    setState(() {
      userData = profileData;
    });
  }

  @override
  Widget build(BuildContext context) {
    var hasNotch = MediaQuery.of(context).padding.top > 24.0;
    return WillPopScope(
      onWillPop: () async {
        // Evitar el comportamiento del botón de retroceso
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
          //Quitar el botón de retroceso
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Imagen de fondo
              Positioned.fill(
                child: Image.asset(
                  'assets/img/background_app.jpg',  // Ruta de la imagen de fondo
                  fit: BoxFit.cover,
                ),
              ),

              // Contenido de la página sobre la imagen de fondo
              SingleChildScrollView(
                child: Column(
                  children: [
                    if (hasNotch)
                      const SizedBox(
                        height: 24.0,
                      ),
                    userData != null
                        ? Column(
                      children: [
                        const CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/img/logos/logo_qro_dig.png'),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          userData!['nombre']+ ' ' + userData!['apellidos'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          userData!['carrera'],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        InfoTable( userData!['email'].toString(), userData!['generacion'].toString()),
                      ],
                    )
                        : const Center(
                      child: CircularProgressIndicator(),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    // Añade aquí otros elementos de tu InfoTable si lo deseas
                    const SizedBox(
                      height: 24.0,
                    ),
                    MenuColumn(),
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

// Tabla de información

Widget InfoTable(String correo, String generacion) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4), // Fondo gris transparente
        borderRadius: BorderRadius.circular(8.0), // Agrega bordes redondeados si lo deseas
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Agrega márgenes alrededor
      child:  Column(
        children: [
          ListTile(
            title: const Text('Correo:'),
            subtitle: Text(correo), // Reemplaza con el correo real
          ),
          ListTile(
            title: const Text('Generación:'),
            subtitle: Text('Generación $generacion'), // Reemplaza con la generación real
          ),
          /*
          ListTile(
            title: Text('Descripción:'),
            subtitle: Text('Soy una persona proactiva que le gusta jugar basquetbol, tocar piano y sobre todo seguir aprendiendo'), // Reemplaza con la descripción real
          ),
          */
        ],
      ),
    );
  }


//Botones en columna
class MenuColumn extends StatelessWidget {
  final Color buttonColor = const Color(0xFF102C44);

  const MenuColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/upload'); // Reemplaza con la ruta de tu página de subida
            },
            icon: Icon(Icons.cloud_upload, color: buttonColor),
            label: Text(
              'Subir documento/archivo',
              style: TextStyle(color: buttonColor),
            ),
          ),
          const SizedBox(height: 10.0),
          _customButton(context, 'Publicaciones', '/home'),
          const SizedBox(height: 10.0),
          _customButton(context, 'Compartir', '/sharePage'),

          SizedBox(height: 10.0),
          _customButton(context, 'Plagio', '/plagio'),
          SizedBox(height: 10.0),
          //_customButton(context, 'Cerrar Sesión', '/logoutPage'),
          TextButton.icon(
            onPressed: () {
              if(logout()){
                Navigator.pushNamed(context, '/main');
              } // Reemplaza con la ruta de tu página de cierre de sesión
            },
            icon: Icon(Icons.logout, color: Colors.red),  // Icono que representa cerrar sesión
            label: const Text(
              'Cerrar sesión',
              style: TextStyle(color: Colors.red),
            ),
          ),
          const SizedBox(height: 20.0),  // Espacio adicional para separar el botón "Eliminar cuenta"

          TextButton.icon(
            onPressed: () {
              if(logout()){
                Navigator.pushNamed(context, '/main');
              } // Reemplaza con la ruta de tu página de eliminación de cuenta
            },
            icon: Icon(Icons.dangerous, color: Colors.red),  // Icono que representa peligro
            label: const Text(
              'Eliminar cuenta',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customButton(BuildContext context, String label, String routeName) {
    return ElevatedButton(
      onPressed: () {
        if (label == 'Compartir') {
          ShareView.showShareDialog(context);
        } else {
          Navigator.pushNamed(context, routeName); // Navegar a la página correspondiente
        }
      },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(label),
        );
    }

  bool logout() {
    try {
      AuthProvider().logout();
      return true;
    } catch (e) {
      return false;
    }
  }
}
