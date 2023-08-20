
import 'package:flutter/material.dart';
import 'dart:math';

class ShareView {
  static void showShareDialog(BuildContext context) {
    int _selectedValue = 0;  // 0 for none, 1 for public, 2 for private

    void _copyLink() {
      String randomLink = 'https://example.com/' + Random().nextInt(1000000).toString();
      // Here you can use the Clipboard widget to copy the link to the clipboard
      // For this example, we are just generating the link

      final snackBar = SnackBar(
        content: Text(
          'Se ha copiado correctamente el link',
          style: TextStyle(fontSize: 18.0),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 8.0,
        margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              backgroundColor: Color(0xFF003D8F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Compartir',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Selecciona la plataforma en la que deseas compartir.',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _selectedValue,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                          activeColor: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFF9D100),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Publico',
                            style: TextStyle(color: Color(0xFF003D8F)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 2,
                          groupValue: _selectedValue,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedValue = value!;
                            });
                          },
                          activeColor: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFF9D100),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Privado',
                            style: TextStyle(color: Color(0xFF003D8F)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _copyLink,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF9D100)),
                      ),
                      child: Text('Copiar link', style: TextStyle(color: Color(0xFF003D8F))),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);  // Close the dialog
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF9D100)),
                      ),
                      child: Text('Cerrar', style: TextStyle(color: Color(0xFF003D8F))),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
