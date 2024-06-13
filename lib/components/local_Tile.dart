import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/localTuristico.dart';
import 'package:provider/provider.dart';
import '../providers/locaisTuristicosProvider.dart';
import '../routers/app_routers.dart';

class Local_Tile extends StatelessWidget{
  final LocalTuristico localTuristico;
  const Local_Tile(this.localTuristico);

  @override
  Widget build(BuildContext context) {
    final image = localTuristico.image == null ||
        localTuristico.image.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(localTuristico.image));
    return ListTile(
      leading: image,
      title: Text(localTuristico.name),
      subtitle: Text(localTuristico.description),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed
                  (AppRouters.USER_FORM,
                  arguments: localTuristico,
                );
              },
            ),
            IconButton(icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Excluir local?'),
                      content: Text('Tem certeza?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text("NÃO"),
                          onPressed: (){
                            Navigator.of(context).pop(false);
                          },
                        ),
                        TextButton(
                            child: Text("SIM"),
                            onPressed: () =>
                                Navigator.of(context).pop(true)

                        ),
                      ],
                    )
                ).then((confirmed){
                  if(confirmed){
                    Provider.of<LocalTuristicoProviders>(context, listen: false).remove(localTuristico);
                  }
                });
              },
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRouters.USER_DETAILS,
          arguments: localTuristico,
        );
      },
    );
  }
}