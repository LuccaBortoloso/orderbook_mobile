import 'package:flutter/material.dart';
import 'package:orderbook_aplicativo/models/Biblioteca.dart';
import 'package:orderbook_aplicativo/providers/bibliotecas.dart';
import 'package:provider/provider.dart';

class BibliotecaTile extends StatelessWidget {
  final Biblioteca biblioteca;

  const BibliotecaTile(this.biblioteca);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.photo),
      ),
      title: Text(biblioteca.nome),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: (){
                Navigator.pushNamed(context, "CreateBiblioteca", arguments: biblioteca);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Biblioteca'),
                    content: Text('Tem certeza disso?'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: (){
                          Provider.of<Bibliotecas>(context, listen: false).remove(biblioteca);
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Não'),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  )
                );
              },
            ),
          ],
        ),
      ),

        onTap: (){
            Navigator.pushNamed(context, "Library");
        },
    );
  }
}
