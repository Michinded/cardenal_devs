import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Esto establece el fondo en azul
      body: Center(
        child: Card(
          elevation: 5.0,
          child: Container(
            width: 300, // Define el ancho que desees para la carta
            height: 300, // Define el alto que desees para la carta
            child: Column(
              children: [
                // Primer 1/5
                Container(
                  color: Colors.white,
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
                  color: Colors.grey[300],
                  height: 120, // 2/5 de 300 = 120
                  child: Center(
                    child: ArticleDetails(
                      title: "Título del artículo",
                      author: "Nombre del autor",
                      date: DateTime.now(),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
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
    return RatingBar.builder(
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
    );
  }
}


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
                ),
              ),
              SizedBox(height: 8.0), // Espacio entre el autor y la fecha
              Text(
                'Fecha: ${date.day}/${date.month}/${date.year}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
