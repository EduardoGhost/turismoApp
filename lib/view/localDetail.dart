import 'package:AppTuristico/models/localTuristico.dart';
import 'package:flutter/material.dart';

class localDetail extends StatelessWidget {
  const localDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalTuristico localTuristico = ModalRoute.of(context)!.settings.arguments as LocalTuristico;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do local"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: localTuristico.image.isNotEmpty
                    ? NetworkImage(localTuristico.image)
                    : null,
                radius: 50,
                child: localTuristico.image.isEmpty ? const Icon(Icons.person, size: 50) : null,
              ),
              const SizedBox(height: 20),
              Text(
                localTuristico.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on, color: Colors.red),
                  const SizedBox(width: 5),
                  Text(
                    localTuristico.local,
                    style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                localTuristico.description,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Horário de funcionamento ${localTuristico.hours}",
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
