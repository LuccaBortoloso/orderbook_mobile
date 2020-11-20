class Usuario {
  String _idUsuario;
  String _nomeUsuario;
  String _emailUsuario;
  String _senhaUsuario;

  Usuario();

  Map <String, dynamic> toMap(){
    Map <String, dynamic> map = {
      "nome": this._nomeUsuario,
      "email": this.emailUsuario
    };

    return map;
  }

  String get senhaUsuario => _senhaUsuario;

  set senhaUsuario(String value) {
    _senhaUsuario = value;
  }

  String get emailUsuario => _emailUsuario;

  set emailUsuario(String value) {
    _emailUsuario = value;
  }

  String get nomeUsuario => _nomeUsuario;

  set nomeUsuario(String value) {
    _nomeUsuario = value;
  }

  String get idUsuario => _idUsuario;

  set idUsuario(String value) {
    _idUsuario = value;
  }
}