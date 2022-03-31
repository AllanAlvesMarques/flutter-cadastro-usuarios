import 'package:cadastro_de_contatos/provider/users_provider.dart';
import 'package:cadastro_de_contatos/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/users.dart';

class mais extends StatelessWidget {
  mais( this.user, {Key? key }) : super(key: key);

   Users? user;
  @override
  Widget build(BuildContext context) {
      final UsersProvider use = Provider.of(context);

      var index = 0;
      bool foto = false;

      for(var i=0; i< use.all.length; i++){
        if(user!.id == use.all[i].id){
          index = i;
        }else{
          index = index;
        }
      }

      if(use.all[index].foto == null || use.all[index].foto == ''){
        foto = true; 
      }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mais'),
        actions: [
          IconButton(
             icon:  use.all[index].isFav ? const Icon(Icons.star) : const Icon(Icons.star_border),
            onPressed: () {
              user!.isFav = !user!.isFav;
              Provider.of<UsersProvider>(context, listen: false).put(user!);
            }
             ),
          IconButton(
             onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.CAD,
                arguments: user,
                );
            },
            icon: const Icon(Icons.edit)
            ),
        ],
      ),
      body: SingleChildScrollView(
              child: Column(  
                children: [
                Stack(
                children: <Widget>[
                  SizedBox(
                    height: 412,
                    width: double.infinity,
                    child: foto ? Image.network(
                    'https://hoteldomhenrique.com.br/avatar/42',
                    fit: BoxFit.cover,
                    ) :Image.network( user!.foto.toString(),
                    fit: BoxFit.cover,
                  ),
              ),
            ],
          ),
          Text('Id: ' + user!.id.toString()),
          Text('Nome: ' + user!.nome.toString()),
          Text('Telefone: ' + user!.telefone.toString()),
          Text('Celular: ' +  user!.celular.toString()),
          Text('E-mail: ' +  user!.email.toString()),
          Text('Endereço: ' +  user!.endereco.toString()),
          Text('Bairro: ' +  user!.bairro.toString()),
          Text('Cidade: ' +  user!.cidade.toString()),
        ]),
      )
    );
  }
}