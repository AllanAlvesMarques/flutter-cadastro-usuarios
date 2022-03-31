import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/mais.dart';
import '../provider/users_provider.dart';


class UserTile extends StatelessWidget {
  UserTile({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
  final UsersProvider use = Provider.of(context);

    return ListView.separated(
        itemCount: use.count,
        itemBuilder: (BuildContext context, int i) {

          final controllerFoto = use.all[i].foto;
          final avatar = controllerFoto == null || controllerFoto.isEmpty
          ? const CircleAvatar(child: Icon(Icons.person)) : CircleAvatar(backgroundImage: NetworkImage(use.all[i].foto!),);

          return ListTile(
            leading: avatar,
            title: Text(use.all[i].nome!),
            subtitle: Text(use.all[i].telefone!),
            trailing:  use.all[i].isFav ? const Icon(Icons.star, color: Colors.yellow,): null,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
             return mais(use.all[i]);
            })
            )
          );
        },
        separatorBuilder:  (_, __) => const Divider(color: Color.fromARGB(255, 211, 211, 211), indent: 25, endIndent: 25),
      );
  }
}