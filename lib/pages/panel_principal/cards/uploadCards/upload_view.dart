import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FormularioView extends StatelessWidget {
  Future<void> _requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  Future<void> _selectFile() async {
    await _requestPermission();
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if(result != null) {
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      // User canceled the file picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subir archivo'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Imagen de fondo
            Positioned.fill(
              child: Image.asset(
                'assets/img/fondo.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Contenido del formulario
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  Image.asset('assets/img/logos/contigo.png', width: 200,
                      fit: BoxFit.cover),  // Reemplaza con la ruta de tu imagen superior
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.white),  // Establece el color de texto del input del usuario
                          decoration: InputDecoration(
                            fillColor: Color(0xFF102C44),
                            filled: true, // Asegúrate de tener esta propiedad en true
                            hintText: 'Título del trabajo',      // Cambia labelText a hintText
                            hintStyle: TextStyle(color: Colors.white),  // Establece el color del hintText
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),  // Redondea las esquinas del borde
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0),  // Redondea las esquinas del borde cuando está habilitado
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0),  // Redondea las esquinas del borde cuando está en foco
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        DropdownButtonFormField(
                          dropdownColor: Color(0xFF102C44),  // Color de fondo de la lista desplegable
                          items: ['Materia','Desarrollo web', 'Matematicas', 'Base de datos']
                              .map((label) => DropdownMenuItem(
                            child: Container(
                              color: Color(0xFF102C44),  // Color de fondo del elemento seleccionado
                              child: Text(label, style: TextStyle(color: Colors.white)),  // Color blanco para las opciones
                            ),
                            value: label,
                          ))
                              .toList(),
                          onChanged: (value) {},
                          hint: Text('Materia', style: TextStyle(color: Colors.white)),  // Color blanco para el hint
                          decoration: InputDecoration(
                            fillColor: Color(0xFF102C44),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        DropdownButtonFormField(
                          dropdownColor: Color(0xFF102C44),  // Color de fondo de la lista desplegable
                          items: ['Carrera', 'Negocios', 'Sistemas', 'Redes']
                              .map((label) => DropdownMenuItem(
                            child: Container(
                              color: Color(0xFF102C44),  // Color de fondo del elemento seleccionado
                              child: Text(label, style: TextStyle(color: Colors.white)),  // Color blanco para las opciones
                            ),
                            value: label,
                          ))
                              .toList(),
                          onChanged: (value) {},
                          hint: Text('Carrera', style: TextStyle(color: Colors.white)),  // Color blanco para el hint
                          decoration: InputDecoration(
                            fillColor: Color(0xFF102C44),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        DropdownButtonFormField(
                          dropdownColor: Color(0xFF102C44),  // Color de fondo de la lista desplegable
                          items: ['Tipo de documento', '.exe', '.pdf', '.mp4']
                              .map((label) => DropdownMenuItem(
                            child: Container(
                              color: Color(0xFF102C44),  // Color de fondo del elemento seleccionado
                              child: Text(label, style: TextStyle(color: Colors.white)),  // Color blanco para las opciones
                            ),
                            value: label,
                          ))
                              .toList(),
                          onChanged: (value) {},
                          hint: Text('Tipo de documento', style: TextStyle(color: Colors.white)),  // Color blanco para el hint
                          decoration: InputDecoration(
                            fillColor: Color(0xFF102C44),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          keyboardType: TextInputType.number,  // Establece el teclado a numérico
                          style: TextStyle(color: Colors.white),  // Establece el color de texto del input del usuario
                          decoration: InputDecoration(
                            fillColor: Color(0xFF102C44),
                            filled: true, // Asegúrate de tener esta propiedad en true
                            hintText: 'Ingresa tu grado',      // Cambia labelText a hintText
                            hintStyle: TextStyle(color: Colors.white),  // Establece el color del hintText
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),  // Redondea las esquinas del borde
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0),  // Redondea las esquinas del borde cuando está habilitado
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0),  // Redondea las esquinas del borde cuando está en foco
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            fillColor: Colors.white, // Color de fondo blanco
                            filled: true,  // Asegúrate de tener esta propiedad en true
                            labelText: 'Añadir una descripción',
                            labelStyle: TextStyle(color: Color(0xFF102C44)), // Color de texto del label
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF102C44)), // Establece el color del borde
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF102C44)), // Establece el color del borde cuando está habilitado
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF102C44)), // Establece el color del borde cuando está en foco
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton.icon(
                          onPressed: () {
                            _selectFile();
                          },
                          icon: Icon(Icons.attach_file, color: Colors.white),  // Ícono de color blanco
                          label: Text('Seleccionar un archivo', style: TextStyle(color: Colors.white)),  // Texto de color blanco
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF102C44),  // Color de fondo del botón
                            onPrimary: Colors.white,  // Color del texto e ícono cuando el botón es presionado
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),  // Bordes redondos
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton.icon(
                          onPressed: () {
                            _selectFile();
                          },
                          icon: Icon(Icons.image, color: Colors.white),  // Ícono de color blanco
                          label: Text('Seleccionar imágenes de muestra', style: TextStyle(color: Colors.white)),  // Texto de color blanco
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF102C44),  // Color de fondo del botón
                            onPrimary: Colors.white,  // Color del texto e ícono cuando el botón es presionado
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),  // Bordes redondos
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Se ha subido correctamente la publicación', style: TextStyle(fontSize: 18.0)),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 8.0,
                                  margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                                )
                            );
                          },
                          child: Text('Subir publicación', style: TextStyle(color: Colors.black)),  // Texto de color negro
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF3C97CB),  // Color de fondo del botón
                            onPrimary: Colors.black,  // Color del texto cuando el botón es presionado
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),  // Bordes redondos
                            ),
                          ),
                        ),
                      ],
                    ),
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