import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/local_Tile.dart';
import '../providers/locaisTuristicosProvider.dart';
import '../routers/app_routers.dart';

class dashboard extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    final LocalTuristicoProviders localTuristico = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Locais turisticos'),
        actions: <Widget>[
          //add local turistico
          IconButton(icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                  AppRouters.LOCALTURISTICO_FORM);
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