import 'package:cadastro_de_contatos/pages/cadastro.dart';
import 'package:cadastro_de_contatos/provider/users_provider.dart';
import 'package:cadastro_de_contatos/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:cadastro_de_contatos/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
      create: (context) => UsersProvider(),
      ),
      ],
      child: MaterialApp(
      title: 'Cadastro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        AppRoutes.HOME: (_) => homePage(),
        AppRoutes.CAD: (_) => Cadastro()
        },
      ),
      );
  }
}
