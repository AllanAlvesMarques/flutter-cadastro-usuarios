import 'dart:math';
import 'package:cadastro_de_contatos/controllers/users_controller.dart';
import 'package:cadastro_de_contatos/models/users.dart';
import 'package:flutter/cupertino.dart';

class UsersProvider with ChangeNotifier {
  List<Users> _items = [...tabela];
  

  List<Users> get all {
    return [..._items];
  }

  int get count {
    return _items.length;
  }

  void put(Users user) {
    if (user == null){
    return;
    }

    final index = _items.indexWhere((element) => element.id == user.id);
    final id = Random().nextDouble().toString();

    if(index == -1){

    _items.add(Users(
      id: id,
      nome: user.nome,
      telefone: user.telefone,
      celular: user.celular,
      email: user.email,
      endereco: user.endereco,
      bairro: user.bairro,
      cidade: user.cidade,
      foto: user.foto,
      isFav: user.isFav,
    ));
    }else{
      _items[index] = user;
    }
  
    notifyListeners();  
  }
}