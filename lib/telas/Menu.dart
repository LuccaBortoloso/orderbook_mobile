import 'package:flutter/material.dart';
import 'package:orderbook_aplicativo/components/biblioteca_tile.dart';
import 'package:orderbook_aplicativo/providers/bibliotecas.dart';
import 'package:provider/provider.dart';


class Menu extends StatefulWidget {

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final Bibliotecas bibliotecas = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Orderbook"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, "CreateBiblioteca", arguments: bibliotecas);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: bibliotecas.count,
        itemBuilder: (context, i) => BibliotecaTile(bibliotecas.byIndex(i)),
      ),
    );
  }
}
