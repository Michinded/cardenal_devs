import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cardenal_devs/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class InfoProfile{
  BuildContext? context;
  // Crear instancia de FireStore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Crear instancia de auth provider para obtener el usuario actual
  User ? user = AuthProvider().getCurrentUser();

  // leer datos de la base de datos de firestore
  // Ruta de la colección: /users/{uid}/
  Future<Map<String, dynamic>?> getInfoUser() async {
    CollectionReference collectionReference = _firestore.collection('users');
    print(user!.uid);
    DocumentSnapshot userDocument = await collectionReference.doc(user!.uid).get();

    if (userDocument.exists) {
      return userDocument.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  }


}