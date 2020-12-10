import 'dart:math';

import 'package:flutter/material.dart';
import 'package:orderbook_aplicativo/data/dummy_bibliotecas.dart';
import 'package:orderbook_aplicativo/models/Biblioteca.dart';

class Bibliotecas with ChangeNotifier{
  final Map<String, Biblioteca> _itemsB = {...DUMMY_BIBLIOTECAS};

  List<Biblioteca> get all {
    return [..._itemsB.values];
  }

  int get count{
    return _itemsB.length;
  }

  Biblioteca byIndex(int i){
    return _itemsB.values.elementAt(i);
  }

  void put(Biblioteca biblioteca){
    if(biblioteca == null){
      return;
    }
    if(biblioteca.id != null && biblioteca.id.trim().isNotEmpty && _itemsB.containsKey(biblioteca.id)){
      _itemsB.update(biblioteca.id, (_) => Biblioteca(id: biblioteca.id, nome: biblioteca.nome));
    } else {
      final id = Random().nextDouble().toString();
      _itemsB.putIfAbsent(id, () =>
          Biblioteca(
              id: biblioteca.id,
              nome: biblioteca.nome
          ));
    }
    notifyListeners();
  }

  void remove(Biblioteca biblioteca){
    if(biblioteca != null && biblioteca.id != null){
      _itemsB.remove(biblioteca.id);
      notifyListeners();
    }
  }
}