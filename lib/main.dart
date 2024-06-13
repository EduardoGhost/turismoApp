import 'package:flutter/material.dart';
import 'package:flutter_project/providers/locaisTuristicosProvider.dart';
import 'package:flutter_project/providers/userProviders.dart';
import 'package:flutter_project/routers/app_routers.dart';
import 'package:flutter_project/view/LoginScreen.dart';
import 'package:flutter_project/view/dashboard.dart';
import 'package:flutter_project/view/userDetail.dart';
import 'package:flutter_project/view/userForm.dart';
import 'package:flutter_project/view/userList.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => UsersProviders()),
          ChangeNotifierProvider(create: (ctx) => LocalTuristicoProviders()),
                    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/dashboard',
      routes: {
        AppRouters.DASHBOARD: (_) => dashboard(),
        AppRouters.HOME: (_) => userList(),
        AppRouters.USER_FORM: (_) => userForm(),
        AppRouters.USER_DETAILS: (_) => userDetail(),
        AppRouters.USER_LOGIN: (_) => LoginScreen(),


      },
    )
    );
  }
}
