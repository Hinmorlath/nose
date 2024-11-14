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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _divitionController,
              decoration: const InputDecoration(
                labelText: 'Divition',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _conferenceController,
              decoration: const InputDecoration(
                labelText: 'Conference',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await _fireStoreService.addTeam(
                _nameController.text,
                _divitionController.text,
                _conferenceController.text,
              );
              _nameController.clear();
              _divitionController.clear();
              _conferenceController.clear();
            },
            child: const Text('Add Team'),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _fireStoreService.getTeams(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name),
                        subtitle: Text(snapshot.data![index].divition),
                        trailing: Text(snapshot.data![index].conference),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
