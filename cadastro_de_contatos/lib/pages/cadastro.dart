import 'package:cadastro_de_contatos/models/users.dart';
import 'package:cadastro_de_contatos/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cadastro extends StatefulWidget {
  Cadastro({ Key? key }) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _form = GlobalKey<FormState>();

  final Map<String, String>_formData = {};

  late TextEditingController controllerTel;

  late TextEditingController controllerEmail;

  @override
  void initState() {
    super.initState();

    controllerTel  = TextEditingController();
    controllerEmail  = TextEditingController();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = ModalRoute.of(context)?.settings.arguments as Users?;

    if(user != null) {

      _formData['id'] = user.id!;
      _formData['nome'] = user.nome!;
      _formData['telefone'] = user.telefone!;
      _formData['celular'] = user.celular!;
      _formData['email'] = user.email!;
      _formData['endereco'] = user.endereco!;
      _formData['bairro'] = user.bairro!;
      _formData['cidade'] = user.cidade!;
      _formData['foto'] = user.foto!;

    controllerTel.text = user.telefone!;
    controllerEmail.text = user.email!;
    }
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastre/Altere'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState?.validate();

              if(isValid!){
              _form.currentState!.save();
              Provider.of<UsersProvider>(context, listen: false).put(Users(
                id: _formData['id'],
                nome: _formData['nome'],
                telefone: _formData['telefone'],
                celular: _formData['celular'],
                email: _formData['email'],
                endereco: _formData['endereco'],
                bairro: _formData['bairro'],
                cidade: _formData['cidade'],
                foto: _formData['foto'] ,
              ));
              Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
        body:Form(
          key: _form,
              child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        initialValue: _formData['nome'],
                          validator: (value) {
                            if(value == null || value.trim().isEmpty){
                            return 'O nome é inválido';
                            }

                            if(value.trim().length < 3) {
                              return 'Nome muito curto.';
                            }
                              return null;
                          },                        
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nome:',
                          ),
                          onSaved: (value) => _formData['nome'] = value!,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                          controller: controllerTel,
                          validator: (value) {

                            if(controllerEmail.text != ''){
                              return null;
                            }

                            if(value == null || value.trim().isEmpty){
                            return 'Telefone invalido, informe o telefone ou o E-mail em seus campos';
                            }

                            if(value.trim().length < 13) {
                              return 'Digite um telefone valido, ex: (xx) xxxx-xxxx';
                            }
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Telefone:',
                          ),
                          onSaved: (value) => _formData['telefone'] = value!,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        initialValue: _formData['celular'],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Celular:',
                          ),
                          onSaved: (value) => _formData['celular'] = value!,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: controllerEmail,
                          validator: (value) {

                            if(controllerTel.text != ''){
                              return null;
                            }

                            if(value == null || value.trim().isEmpty){
                            return 'E-mail invalido, informe o E-mail ou o telefone em seus campos';
                            }

                            if(value.trim().contains('@') == false) {
                              return 'Digite um E-mail valido';
                            }
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-mail:',
                          ),
                          onSaved: (value) => _formData['email'] = value!,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        initialValue: _formData['endereco'],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Endereço:',
                          ),
                          onSaved: (value) => _formData['endereco'] = value!,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        initialValue: _formData['bairro'],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Bairro:',
                          ),
                          onSaved: (value) => _formData['bairro'] = value!,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        initialValue: _formData['cidade'],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Cidade:',
                          ),
                          onSaved: (value) => _formData['cidade'] = value!,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        initialValue: _formData['foto'],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Foto:',
                          ),
                          onSaved: (value) => _formData['foto'] = value!,
                      ),
                  ),
                ],
              ),
            ),
        ),
      );
  }
}