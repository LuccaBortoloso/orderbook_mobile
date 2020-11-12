import 'package:flutter/material.dart';
import 'package:orderbook_aplicativo/components/livro_tile.dart';
import 'package:provider/provider.dart';
import 'package:orderbook_aplicativo/providers/livros.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    final Livros livros = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Biblioteca"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, "CreateLivro", arguments: livros);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: livros.count,
        itemBuilder: (context, i) => Livro_Tile(livros.byIndex(i)),
      ),
    );
  }
}
