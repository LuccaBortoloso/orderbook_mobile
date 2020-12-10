import 'package:flutter/cupertino.dart';
import 'package:orderbook_aplicativo/data/dummy_filtro.dart';

class FiltroNotifier extends ChangeNotifier{
  String _currentFiltro = filtros[0];

  FiltroNotifier();

  String get currentFiltro => _currentFiltro;

  updateFiltro(String value) {
    if(value != _currentFiltro){
      _currentFiltro = value;
      notifyListeners();
    }
  }
}