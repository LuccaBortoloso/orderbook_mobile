import 'package:flutter/material.dart';

class Livro {
  final String id;
  final String nome;
  final String genero;
  final String urlCapaLivro;
  final String nomeEditora;
  final String anoPublicacao;
  final String corCapa;
  final int qntPaginas;

  const Livro({this.id, @required this.nome, @required this.genero, @required this.urlCapaLivro,
    @required this.nomeEditora, @required this.anoPublicacao, @required this.corCapa, @required this.qntPaginas});

}