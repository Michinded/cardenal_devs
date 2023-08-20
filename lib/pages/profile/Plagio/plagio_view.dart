
import 'package:flutter/material.dart';

class PlagioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verificar Plagio'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/fondo.jpg',  // Replace with the path to your actual image
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Loading symbol
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(height: 20.0),
                  // Text input field
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Pega o escribe el texto a verificar',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Search button
                  ElevatedButton(
                    onPressed: () {
                      // Logic to handle search action
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // Randomly select a dialog option
                          int randomChoice = DateTime.now().millisecondsSinceEpoch % 2;

                          if (randomChoice == 0) {
                            return AlertDialog(
                              backgroundColor: Color(0xFF003D8F),
                              content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('No se encontraron coincidencias', style: TextStyle(color: Colors.white)),
                                  ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Cerrar', style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            );
                          } else {
                            return AlertDialog(
                              backgroundColor: Color(0xFF003D8F),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('71% de coincidencias', style: TextStyle(color: Colors.white)),
                                  Text('Autor: José N', style: TextStyle(color: Colors.white)),
                                  TextButton(
                                    onPressed: () => Navigator.pushNamed(context, '/card'),
                                    child: Text('Documento original', style: TextStyle(color: Colors.yellow),),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      );
                    },
                    child: Text('Buscar', style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF3C97CB),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
