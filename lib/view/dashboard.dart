import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/local_Tile.dart';
import '../providers/locaisTuristicosProvider.dart';
import '../routers/app_routers.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LocalTuristicoProviders localTuristico = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locais turísticos'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // implementar metodo notificação

            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRouters.LOCALTURISTICO_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: localTuristico.count,
        itemBuilder: (ctx, i) => Container(
          color: Colors.grey[200],
          child: Local_Tile(localTuristico.byIndex(i)),
        ),
      ),
    );
  }
}
