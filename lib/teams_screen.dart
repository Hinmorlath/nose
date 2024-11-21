import 'package:flutter/material.dart';
import 'package:nose/fire_store_service.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  final FireStoreService _fireStoreService = FireStoreService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _firstLastNameController =
      TextEditingController();
  final TextEditingController _secondLastNameController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
              'Equipos de la NFL, según porque yo hice mis propias cosas'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _firstLastNameController,
              decoration: const InputDecoration(labelText: 'apellidoP'),
            ),
            TextField(
              controller: _secondLastNameController,
              decoration: const InputDecoration(labelText: 'apellidoM'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => {},
              child: const Text('Guardar Person'),
            ),
          ],
        ));
  }
}
