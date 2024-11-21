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
  final TextEditingController _divitionController = TextEditingController();
  final TextEditingController _conferenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipos de la NFL'),
      ),
    );
  }
}
