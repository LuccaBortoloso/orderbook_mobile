import 'dart:math';

import 'package:flutter/material.dart';
import 'package:orderbook_aplicativo/data/dummy_livros.dart';
import 'package:orderbook_aplicativo/models/Livro.dart';

class Livros with ChangeNotifier{
  final Map<String, Livro> _items = {...DUMMY_LIVROS};

  List<Livro> get all {
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  Livro byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(Livro livro){
    if(livro == null){
      return;
    }
    if(livro.id != null && livro.id.trim().isNotEmpty && _items.containsKey(livro.id)){
      _items.update(livro.id, (_) => livro);
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () =>
          Livro(
              id: id,
              nome: livro.nome,
              genero: livro.genero,
              urlCapaLivro: livro.urlCapaLivro
          ));
    }
    notifyListeners();
  }

  void remove(Livro livro){
    if(livro != null && livro.id != null){
      _items.remove(livro.id);
      notifyListeners();
    }
  }
}