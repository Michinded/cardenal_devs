import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).padding.top > 24.0;
    final bool isVerified = true; // Cambia este valor según tu lógica de verificación

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('path_to_your_background_image'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                if (hasNotch) SizedBox(height: 24.0),
                CenterImageWidget(),
                SizedBox(height: 20.0),
                VerificationPanel(isVerified: isVerified),
                SizedBox(height: 20.0),
                InformationPanel(),
              ],
            ),
          ),
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
      child: Image.asset('path_to_your_image', width: 100, height: 100), // Ajusta el tamaño según tus necesidades
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
          Text('Título: Título del documento'),
          Text('Autor: Nombre del autor'),
          // ... Agrega los demás campos aquí
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: CardView()));
