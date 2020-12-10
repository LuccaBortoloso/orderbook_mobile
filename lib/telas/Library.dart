import 'package:flutter/material.dart';
import 'package:orderbook_aplicativo/components/livro_tile.dart';
import 'package:orderbook_aplicativo/data/dummy_filtro.dart';
import 'package:orderbook_aplicativo/providers/filtros.dart';
import 'package:provider/provider.dart';
import 'package:orderbook_aplicativo/providers/livros.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  _showFiltro(BuildContext context) => showDialog(
      context: context, builder: (context) {
        final _singleNotifier = Provider.of<FiltroNotifier>(context);

        return AlertDialog(
          title: Text("Selecione o filtro"),
          content: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                  filtros.map((e) => RadioListTile(
                    title: Text(e),
                    value: e,
                    groupValue: _singleNotifier.currentFiltro,
                    selected: _singleNotifier.currentFiltro == e,
                    onChanged: (value){
                      _singleNotifier.updateFiltro(value);
                      Navigator.of(context).pop();
                    },
                  )).toList(),
              ),
            ),
          ),
        );
  });
  
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_list),
        onPressed: () => _showFiltro(context),
      ),

    );
  }
}
