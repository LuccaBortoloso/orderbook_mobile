import 'dart:collection';
import 'dart:math';
import 'package:sortedmap/sortedmap.dart';
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

  void put(Livro livro, int index){
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
    sort(index);
    notifyListeners();
  }

  void remove(Livro livro){
    if(livro != null && livro.id != null){
      _items.remove(livro.id);
      notifyListeners();
    }
  }

  sort(int index){
    var keys = _items.keys.toList();
    print(keys);

    switch(index){
      case 0:
        var key = _items.keys.toList(growable:false)
          ..sort((k1, k2) => _items[k1].nome.compareTo(_items[k2].nome));
        LinkedHashMap sortedMap = new LinkedHashMap
            .fromIterable(key, key: (k) => k, value: (k) => _items[k]);

        _items.clear();
        for(int i = 0; i < key.length; i++){
          _items.putIfAbsent(key[i], () => sortedMap[key[i]]);
        }
        keys = _items.keys.toList();
        print(keys);
        print("passou");
        break;
      case 1:
        var key = _items.keys.toList(growable:false)
          ..sort((k1, k2) => _items[k1].genero.compareTo(_items[k2].genero));
        LinkedHashMap sortedMap = new LinkedHashMap
            .fromIterable(key, key: (k) => k, value: (k) => _items[k]);

        _items.clear();
        for(int i = 0; i < key.length; i++){
          _items.putIfAbsent(key[i], () => sortedMap[key[i]]);
        }
        keys = _items.keys.toList();
        print(keys);
        print("passou");
        break;
      case 2:
        var key = _items.keys.toList(growable:false)
          ..sort((k1, k2) => _items[k1].nomeEditora.compareTo(_items[k2].nomeEditora));
        LinkedHashMap sortedMap = new LinkedHashMap
            .fromIterable(key, key: (k) => k, value: (k) => _items[k]);

        _items.clear();
        for(int i = 0; i < key.length; i++){
          _items.putIfAbsent(key[i], () => sortedMap[key[i]]);
        }
        keys = _items.keys.toList();
        print(keys);
        print("passou");
        break;
      case 3:
        var key = _items.keys.toList(growable:false)
          ..sort((k1, k2) => _items[k1].corCapa.compareTo(_items[k2].corCapa));
        LinkedHashMap sortedMap = new LinkedHashMap
            .fromIterable(key, key: (k) => k, value: (k) => _items[k]);

        _items.clear();
        for(int i = 0; i < key.length; i++){
          _items.putIfAbsent(key[i], () => sortedMap[key[i]]);
        }
        keys = _items.keys.toList();
        print(keys);
        print("passou");
        break;
    }

  }
}