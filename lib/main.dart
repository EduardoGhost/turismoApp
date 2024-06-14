import 'package:AppTuristico/providers/locaisTuristicosProvider.dart';
import 'package:AppTuristico/providers/userProviders.dart';
import 'package:AppTuristico/routers/app_routers.dart';
import 'package:AppTuristico/view/LoginScreen.dart';
import 'package:AppTuristico/view/dashboard.dart';
import 'package:AppTuristico/view/localDetail.dart';
import 'package:AppTuristico/view/localTuristicoForm.dart';
import 'package:AppTuristico/view/userDetail.dart';
import 'package:AppTuristico/view/userForm.dart';
import 'package:AppTuristico/view/userList.dart';
import 'package:flutter/material.dart';
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
      title: 'AppTuristico',
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
        AppRouters.LOCALTURISTICO_FORM: (_) => LocalTuristicoForm(),
        AppRouters.LOCALTURISTICO_DETAIL: (_) => localDetail(),


      },
    )
    );
  }
}
