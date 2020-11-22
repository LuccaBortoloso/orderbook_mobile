import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orderbook_aplicativo/components/biblioteca_tile.dart';
import 'package:orderbook_aplicativo/providers/bibliotecas.dart';
import 'package:provider/provider.dart';


class Menu extends StatefulWidget {

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  _deslogarUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacementNamed(context, "/");
  }

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
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              _deslogarUsuario();
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
