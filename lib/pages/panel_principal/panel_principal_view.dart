import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Esto puede ser innecesario ya que tendrás una imagen de fondo
      body: SafeArea(
        child: Stack(
          children: [
            // Imagen de fondo
            Positioned.fill(
              child: Image.asset(
                'assets/img/fondo.jpg',  // Reemplaza por la ruta de tu imagen
                fit: BoxFit.cover,
              ),
            ),
            // Contenido sobre la imagen
            SingleChildScrollView(
              child: Column(
                children: [
                  ProfileCard(
                    imagePath: 'assets/img/perfil.jpeg',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SearchWithButton(),
                  ),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(10, (index) {
                      return _MiContentCard("Doc${index + 1}", "Adrian Lino");
                    }),
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




  //carta de contenidos subidos y calificarlos
  Widget _MiContentCard(String titulo, String autor) {


    return Card(
      elevation: 5.0,
      child: Container(
        width: 300, // Define el ancho que desees para la carta
        height: 300, // Define el alto que desees para la carta
        child: Column(
          children: [
            // Primer 1/5
            Container(
              color: Color(0xFF102C44),  // Cambio de color aquí
              height: 60, // 1/5 de 300 = 60
              child: Center(
                child: CustomRatingBar(
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
            ),
            // Segundo 2/5
            Container(
              color: Colors.grey[200],
              height: 120, // 2/5 de 300 = 120
              child: Center(
                child: Text('Contenido del segundo divisor'),
              ),
            ),
            // Tercer 2/5
            Container(
              color: Color(0xFF102C44),  // Cambio de color aquí
              height: 120, // 2/5 de 300 = 120
              child: Center(
                child: ArticleDetails(
                  title: titulo,
                  author: autor,
                  date: DateTime.now(),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }


// Seccion de seleccion de perfil
class ProfileCard extends StatelessWidget {
  final String imagePath;

  ProfileCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(

        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 25.0, // El radio se define para que el círculo tenga un tamaño de 50 (diámetro)
            ),
            SizedBox(width: 10.0), // Espacio entre el círculo y el borde derecho de la carta
          ],
        ),
      ),
    );
  }

}


// buscador con componentes filtro
class SearchWithButton extends StatefulWidget {
  @override
  _SearchWithButtonState createState() => _SearchWithButtonState();
}

class _SearchWithButtonState extends State<SearchWithButton> {
  TextEditingController _controller = TextEditingController();
  bool isDropdownVisible = false;  // Variable para rastrear la visibilidad de DropdownButtonsRow
  final Color customColor = Color(0xFF102C44);  // Nuevo color personalizado

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Buscar',
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    prefixIcon: CircleAvatar(
                      backgroundColor: customColor,
                      child: Icon(Icons.search, color: Colors.white),
                      radius: 15.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: customColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: customColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: customColor),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              FloatingActionButton(
                backgroundColor: customColor,
                mini: true,
                child: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    isDropdownVisible = !isDropdownVisible;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10.0),
          if (isDropdownVisible)
            DropdownButtonsRow(),
        ],
      ),
    );
  }
}


//botones despegables de busqueda
class DropdownButtonsRow extends StatefulWidget {
  @override
  _DropdownButtonsRowState createState() => _DropdownButtonsRowState();
}

class _DropdownButtonsRowState extends State<DropdownButtonsRow> {
  String? selectedCarrera;
  String? selectedMateria;
  String? selectedPuntaje;
  String? selectedTipo;

  final Color customColor = Color(0xFF102C44);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      runSpacing: 5.0,
      children: [
        _buildDropdownButton(
          items: ['Carrera 1', 'Carrera 2', 'Carrera 3'],
          value: selectedCarrera,
          hint: 'Carrera',
          onChanged: (value) {
            setState(() {
              selectedCarrera = value;
            });
          },
        ),
        _buildDropdownButton(
          items: ['Materia 1', 'Materia 2', 'Materia 3'],
          value: selectedMateria,
          hint: 'Materia',
          onChanged: (value) {
            setState(() {
              selectedMateria = value;
            });
          },
        ),
        _buildDropdownButton(
          items: ['Puntaje 1', 'Puntaje 2', 'Puntaje 3'],
          value: selectedPuntaje,
          hint: 'Puntaje',
          onChanged: (value) {
            setState(() {
              selectedPuntaje = value;
            });
          },
        ),
        _buildDropdownButton(
          items: ['Tipo 1', 'Tipo 2', 'Tipo 3'],
          value: selectedTipo,
          hint: 'Tipo',
          onChanged: (value) {
            setState(() {
              selectedTipo = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildDropdownButton({
    required List<String> items,
    required String? value,
    required String hint,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 0),
      decoration: BoxDecoration(
        color: customColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: customColor,
          style: TextStyle(color: Colors.white, fontSize: 14.0),
          value: value,
          hint: Text(hint, style: TextStyle(color: Colors.white, fontSize: 14.0,fontWeight: FontWeight.bold,)),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(fontSize: 14.0)),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}





//panel de estrellas
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
      color: Color(0xFF102C44), // Agregamos el color de fondo aquí
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


//detalles de la carta de proyecto
class ArticleDetails extends StatelessWidget {
  final String title;
  final String author;
  final DateTime date;

  ArticleDetails({
    required this.title,
    required this.author,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Centra el título
      children: [
        // Título con un margen superior y centrado
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,  // Color blanco para el título
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 8.0), // Espacio entre el título y el autor
        // Contenido (Autor y Fecha) alineado a la izquierda con un margen izquierdo
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Autor: $author',
                style: TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,  // Escala de blanco para el autor
                ),
              ),
              SizedBox(height: 8.0), // Espacio entre el autor y la fecha
              Text(
                'Fecha: ${date.day}/${date.month}/${date.year}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white60,  // Escala de blanco para la fecha
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

