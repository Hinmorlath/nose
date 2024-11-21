import 'package:cloud_firestore/cloud_firestore.dart';

class Team {
  final String id;
  final String nombre;
  final String apellidoP;
  final String apellidoM;

  Team(
      {required this.id,
      required this.nombre,
      required this.apellidoP,
      required this.apellidoM});

  // Convertir un Team a un Map
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'apellidoP': apellidoP,
      'apellidoM': apellidoM,
    };
  }

  // Crear un team desde un DocumentSnapShot
  factory Team.fromDocumentSnapshot(DocumentSnapshot doc) {
    return Team(
      id: doc.id,
      nombre: doc['nombre'],
      apellidoP: doc['division'],
      apellidoM: doc['conferencia'],
    );
  }
}
