import 'package:cadastro_de_contatos/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../components/user_tile.dart';

class homePage extends StatelessWidget {
  homePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes Cadastrados'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.CAD);
            },
            icon: const Icon(Icons.group_add),
            ),
        ],
      ),
      body: UserTile(),
    );
  }
}