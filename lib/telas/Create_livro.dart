import 'package:flutter/material.dart';
import 'package:orderbook_aplicativo/models/Livro.dart';
import 'package:orderbook_aplicativo/providers/livros.dart';
import 'package:provider/provider.dart';

class CreateLivro extends StatefulWidget {
  @override
  _CreateLivroState createState() => _CreateLivroState();
}

class _CreateLivroState extends State<CreateLivro> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Livro livro){
    if(livro != null){
      _formData['id'] = livro.id;
      _formData['nome'] = livro.nome;
      _formData['genero'] = livro.genero;
      _formData['urlCapaLivro'] = livro.urlCapaLivro;
    }
  }

  @override
  Widget build(BuildContext context) {
    Livro livro = ModalRoute.of(context).settings.arguments;
    _loadFormData(livro);

    return Scaffold(
      appBar: AppBar(
        title: Text('Criar livro'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final isValid = _form.currentState.validate();
              if(isValid){
                _form.currentState.save();
                Provider.of<Livros>(context, listen: false).put(
                    Livro(id: _formData['id'], nome: _formData['nome'], genero: _formData['genero'], urlCapaLivro: _formData['urlCapaLivro'])
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
                onSaved: (value) => _formData['nome'] = value,
              ),
              TextFormField(
                initialValue: _formData['genero'],
                decoration: InputDecoration(
                  labelText: 'Genero',
                ),
                onSaved: (value) => _formData['genero'] = value,
              ),
              TextFormField(
                initialValue: _formData['urlCapaLivro'],
                decoration: InputDecoration(
                  labelText: 'URL da capa do livro',
                ),
                onSaved: (value) => _formData['urlCapaLivro'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
