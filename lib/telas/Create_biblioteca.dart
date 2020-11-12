import 'package:flutter/material.dart';
import 'package:orderbook_aplicativo/models/Biblioteca.dart';
import 'package:orderbook_aplicativo/providers/bibliotecas.dart';
import 'package:provider/provider.dart';

class CreateBiblioteca extends StatefulWidget {
  @override
  _CreateBibliotecaState createState() => _CreateBibliotecaState();
}

class _CreateBibliotecaState extends State<CreateBiblioteca> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Biblioteca biblioteca){
    if(biblioteca != null){
      _formData['id'] = biblioteca.id;
      _formData['nome'] = biblioteca.nome;
    }
  }

  @override
  Widget build(BuildContext context) {
    Biblioteca biblioteca = ModalRoute.of(context).settings.arguments;
    _loadFormData(biblioteca);

    return Scaffold(
      appBar: AppBar(
        title: Text('Criar biblioteca'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final isValid = _form.currentState.validate();
              if(isValid){
                _form.currentState.save();
                Provider.of<Bibliotecas>(context, listen: false).put(
                  Biblioteca(id: _formData['id'], nome: _formData['nome'])
                );
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Nome inválido';
                  }
                  if(value.trim().length < 3){
                    return 'Nome muito pequeno';
                  }
                  return null;
                },
                onSaved: (value) => _formData['nome'] = value,
              )
            ],
          ),
        ),
      ),
    );
  }
}
