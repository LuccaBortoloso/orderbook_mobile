import 'package:flutter/material.dart';

class Livro {
  final String id;
  final String nome;
  final String genero;
  final String urlCapaLivro;

  const Livro({this.id, @required this.nome, @required this.genero, @required this.urlCapaLivro});

}