import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).padding.top > 24.0;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/img/fondo.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  if (hasNotch) SizedBox(height: 24.0),
                  CenterImageWidget(),
                  SizedBox(height: 20.0),
                  VerificationPanel(isVerified: true),  // Suponiendo que tienes este widget
                  SizedBox(height: 20.0),
                  InformationPanel(),  // Suponiendo que tienes este widget
                  SizedBox(height: 60.0),
                  CustomGadget(),  // El widget anterior
                  SizedBox(height: 60.0),
                  SquareWidget(),  // Aquí estamos añadiendo el SquareWidget después del último componente
                  SizedBox(height: 20.0),
                  SquareWidget(),
                  SizedBox(height: 20.0),
                  DownloadButton(fileUrl: 'assets/img/prueba.pdf')
                  // Puedes continuar agregando otros widgets si lo deseas
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CenterImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Image.asset('assets/img/perfil.jpeg', width: 400, height: 400), // Ajusta el tamaño según tus necesidades
    );
  }
}

class VerificationPanel extends StatelessWidget {
  final bool isVerified;

  VerificationPanel({required this.isVerified});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xFF102C44),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Text('Verificado:', style: TextStyle(color: Colors.white)),
          Spacer(),
          Icon(
            isVerified ? Icons.check_circle : Icons.error,
            color: isVerified ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }
}

class InformationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF102C44)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text('Título :' +' Título del documento'),
      SizedBox(height: 8.0),  // Espacio
      Text('Autor :'+ 'Nombre del autor'),
      SizedBox(height: 8.0),  // Espacio
      Text('Carrera :'+ 'Nombre de la carrera'),
      SizedBox(height: 8.0),  // Espacio
      Text('Grado :'+ '7Tmo'),
      SizedBox(height: 8.0),  // Espacio
      Text('Generacion :'+ 'novena'),
      SizedBox(height: 8.0),  // Espacio
      Text('Fecha :'+ '20/08/2023'),
      SizedBox(height: 8.0),  // Espacio
      Text('Tipo :'+ 'pdf'),
      SizedBox(height: 8.0),  // Espacio
      Text('Descripcion :'+ 'proyecto final fisica avanzada'),
      SizedBox(height: 8.0),  // Espacio
      SizedBox(height: 8.0),  // Espacio
      Text('Correcciones:' + " 4"),

        ],
      ),
    );
  }
}



class CustomRatingBar extends StatelessWidget {
  final double initialRating;
  final ValueChanged<double> onRatingUpdate;

  CustomRatingBar({
    this.initialRating = 3.0,
    required this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RatingBar.builder(
        initialRating: initialRating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        onRatingUpdate: (rating) {
          print(rating);
        },
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
      ),
    );
  }
}

//formulario para correciones o experiencia

class CustomGadget extends StatefulWidget {
  @override
  _CustomGadgetState createState() => _CustomGadgetState();
}

class _CustomGadgetState extends State<CustomGadget> {
  List<bool> _isSelected = [false, false];  // Representa el estado de los botones (Experiencia, Corrección)

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CustomRatingBar
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7, // 70% del ancho de la pantalla
            child: CustomRatingBar(
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
        ),
        SizedBox(height: 10),

        // TextArea
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFF102C44), width: 2.0),  // Grosor del borde aumentado a 2.0
          ),
          child: TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(8.0),
              hintText: 'Escribe aquí...',
            ),
          ),
        ),
        SizedBox(height: 10),

        // Botones de Experiencia o Corrección
        ToggleButtons(
          borderColor: Color(0xFF102C44),
          fillColor: Color(0xFF102C44),
          selectedBorderColor: Color(0xFF102C44),
          selectedColor: Colors.white,
          borderRadius: BorderRadius.circular(4),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text('Experiencia'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text('Corrección'),
            ),
          ],
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < _isSelected.length; i++) {
                _isSelected[i] = i == index;
              }
            });
          },
          isSelected: _isSelected,
        ),
        SizedBox(height: 10),

        // Botón de Enviar
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF102C44),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          ),
          onPressed: () {
            // Acción del botón enviar
          },
          child: Text('Enviar'),
        ),
      ],
    );
  }
}

//cuadro de opiniones
class SquareWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;  // 90% del ancho de la pantalla

    return Center(
      child: Container(
        width: width,
        height: 100,  // Estableciendo el alto en 200
        color: Color(0xFF003D8F),
        child: Stack(
          children: [
            // CustomRatingBar en la esquina superior izquierda
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomRatingBar(
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
            ),

            // Botón en la esquina superior derecha
            Align(
              alignment: Alignment.topRight,
              child: PopupMenuButton<String>(
                icon: Icon(Icons.more_vert),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Editar',
                    child: Text('Editar'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Eliminar',
                    child: Text('Eliminar'),
                  ),
                ],
                onSelected: (value) {
                  print(value);  // Puedes añadir acciones aquí según la opción seleccionada
                },
              ),
            ),

            // Texto en negritas
            Positioned(
              bottom: 20,
              left: 20,
              child: Text(
                'Este es de los mejores trabajos que he visto',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//boton de descarga
class DownloadButton extends StatefulWidget {
  final String fileUrl;

  DownloadButton({required this.fileUrl});

  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  final Dio _dio = Dio();

  Future<void> _downloadFile() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      await _dio.download(
        widget.fileUrl,
        '${dir.path}/myDownloadedFile.pdf',
        onReceiveProgress: (received, total) {
          if (total != -1) {
            print((received / total * 100).toStringAsFixed(0) + "%");
          }
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Descarga completada!')),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en la descarga')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: _downloadFile,
        icon: Icon(Icons.download_rounded),
        label: Text('Descargar'),
      ),
    );
  }
}


