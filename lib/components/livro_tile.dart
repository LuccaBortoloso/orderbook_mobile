import 'package:flutter/material.dart';
import 'package:orderbook_aplicativo/models/Livro.dart';
import 'package:orderbook_aplicativo/providers/livros.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Livro_Tile extends StatelessWidget {
  final Livro livro;
  const Livro_Tile(this.livro);

  @override
  Widget build(BuildContext context) {
    final imageLivro = livro.urlCapaLivro == null || livro.urlCapaLivro.isEmpty ? CircleAvatar(child: Icon(Icons.photo)) : CircleAvatar(backgroundImage: NetworkImage(livro.urlCapaLivro));
    return ListTile(
      leading: imageLivro,
      title: Text(livro.nome),
      subtitle: Text(livro.genero),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Excluir Livro'),
                      content: Text('Tem certeza disso?'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Sim'),
                          onPressed: (){
                            Provider.of<Livros>(context, listen: false).remove(livro);
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
    );
  }
}
