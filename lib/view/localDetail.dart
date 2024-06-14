import 'package:AppTuristico/models/localTuristico.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class localDetail extends StatelessWidget {
  const localDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalTuristico localTuristico = ModalRoute.of(context)!.settings.arguments as LocalTuristico;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do local"),
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
                child: localTuristico.image.isEmpty ? Icon(Icons.person, size: 50) : null,
              ),
              SizedBox(height: 20),
              Text(
                localTuristico.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                localTuristico.description,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Horário de funcionamento ${localTuristico.hours}",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                localTuristico.local,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
