import 'package:flutter/material.dart';
import 'package:orderbook_aplicativo/telas/Create_biblioteca.dart';
import 'package:orderbook_aplicativo/telas/Create_livro.dart';
import 'package:orderbook_aplicativo/telas/Home.dart';
import 'package:orderbook_aplicativo/telas/Cadastro.dart';
import 'package:orderbook_aplicativo/telas/Library.dart';
import 'package:orderbook_aplicativo/telas/Menu.dart';

class Rotas{
  static Route <dynamic> gerarRotas(RouteSettings settings){

    switch(settings.name){
      case "/":
        return MaterialPageRoute(
            builder: (_) => Home()
        );

      case "Cadastro":
        return MaterialPageRoute(
            builder: (_) => Cadastro()
        );

      case "Menu":
        return MaterialPageRoute(
            builder: (_) => Menu()
        );

      case "CreateBiblioteca":
        return MaterialPageRoute(
            builder: (_) => CreateBiblioteca()
        );
      case "Library":
        return MaterialPageRoute(
            builder: (_) => Library()
        );
      case "CreateLivro":
        return MaterialPageRoute(
            builder: (_) => CreateLivro()
        );

      default:
        _erroRota();
    }
  }

  static Route <dynamic> _erroRota(){
    return MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Tela não encontrada"),
            ),
            body: Center(
              child: Text("Tela não encontrada!"),
            ),
          );


        }
    );
  }
}