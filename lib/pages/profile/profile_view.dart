import 'package:flutter/material.dart';
import 'share/share_view.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hasNotch = MediaQuery.of(context).padding.top > 24.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Imagen de fondo
            Positioned.fill(
              child: Image.asset(
                'assets/img/fondo.jpg',  // Reemplaza con la ruta de tu imagen
                fit: BoxFit.cover,  // Esto hará que la imagen cubra toda la pantalla y se ajuste adecuadamente.
              ),
            ),

            // Contenido de la página sobre la imagen de fondo
            SingleChildScrollView(
              child: Column(
                children: [
                  if (hasNotch)
                    SizedBox(
                      height: 24.0, // Un espacio adicional si hay muesca
                    ),
                  ProfileWidget(),
                  SizedBox(
                    height: 24.0, // Espacio entre el perfil y la tabla de información
                  ),
                  InfoTable(),
                  SizedBox(
                    height: 24.0, // Espacio adicional antes de los botones
                  ),
                  MenuColumn(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage('assets/img/perfil.jpeg'), // Reemplaza esto con tu imagen
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          'Nombre del Usuario',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Text(
          'Carrera que cursa',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class InfoTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4), // Fondo gris transparente
        borderRadius: BorderRadius.circular(8.0), // Agrega bordes redondeados si lo deseas
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Agrega márgenes alrededor
      child: Column(
        children: [
          ListTile(
            title: Text('Correo:'),
            subtitle: Text('correo@example.com'), // Reemplaza con el correo real
          ),
          ListTile(
            title: Text('Generación:'),
            subtitle: Text('Generación 2023'), // Reemplaza con la generación real
          ),
          ListTile(
            title: Text('Descripción:'),
            subtitle: Text('Soy una persona proactiva que le gusta jugar basquetbol, tocar piano y sobre todo seguir aprendiendo'), // Reemplaza con la descripción real
          ),
        ],
      ),
    );
  }
}


//Botones en columna
class MenuColumn extends StatelessWidget {
  final Color buttonColor = Color(0xFF102C44);

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
          SizedBox(height: 10.0),
          _customButton(context, 'Publicaciones', '/home'),
          SizedBox(height: 10.0),
          _customButton(context, 'Compartir', '/sharePage'),
          SizedBox(height: 10.0),
          _customButton(context, 'Plagio', '/plagiarismPage'),
          SizedBox(height: 10.0),
          _customButton(context, 'Cerrar Sesión', '/logoutPage'),
          SizedBox(height: 20.0),  // Espacio adicional para separar el botón "Eliminar cuenta"
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/deleteAccountPage'); // Reemplaza con la ruta de tu página de eliminación de cuenta
            },
            icon: Icon(Icons.dangerous, color: Colors.red),  // Icono que representa peligro
            label: Text(
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
        primary: buttonColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(label),
    );
  }
}
