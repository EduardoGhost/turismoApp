import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/user_tile.dart';
import '../providers/userProviders.dart';
import '../routers/app_routers.dart';

class userList extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    final UsersProviders users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuarios'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
            onPressed: () {
            Navigator.of(context).pushNamed(
              AppRouters.USER_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => Container(
          color: Colors.grey[200],
          child: UserTile(users.byIndex(i)),
        ),
      ),

    );
  }
}