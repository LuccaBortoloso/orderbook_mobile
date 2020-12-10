import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orderbook_aplicativo/models/Usuario.dart';
import 'package:orderbook_aplicativo/telas/Cadastro.dart';
import 'package:orderbook_aplicativo/telas/Menu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  bool _carregando = false;
  String _mensagemErro = " ";

  _validarCampos(){
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    if(email.isNotEmpty && email.contains("@")){
      if(senha.isNotEmpty){
        Usuario usuario = Usuario();
        usuario.emailUsuario = email;
        usuario.senhaUsuario = senha;

        _logarUsuario(usuario);
      }
    }

  }

  _logarUsuario(Usuario usuario){
    setState(() {
      _carregando = true;
      FirebaseAuth auth = FirebaseAuth.instance;

      auth.signInWithEmailAndPassword(email: usuario.emailUsuario, password: usuario.senhaUsuario).then((User){
        _redirecionarPainel(User.user.uid);
      }).catchError((error){
        _mensagemErro = "Erro ao autenticar o usuário!";
      });

    });
  }

  _redirecionarPainel(String idUsuario) async{
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot = await db.collection("usuarios").doc(idUsuario).get();
    setState(() {
      _carregando = false;
    });
    Navigator.pushReplacementNamed(context, "Menu");
  }

  _verificarUsuarioLogado() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = await auth.currentUser;

    if(usuarioLogado != null){
      String idUsuario = usuarioLogado.uid;
      _redirecionarPainel(idUsuario);
    }
  }

  @override
  void initState(){
    super.initState();
    _verificarUsuarioLogado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("imagens/fundo.jpg"), fit: BoxFit.cover)
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _controllerEmail,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "E-mail",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)
                      )
                  ),
                ),
                TextField(
                  controller: _controllerSenha,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)
                      )
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 16,bottom: 10),
                  child: RaisedButton(
                    child: Text("Entrar", style: TextStyle(color: Colors.white, fontSize: 20),),
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    onPressed: (){
                      _validarCampos();
                    },
                    color: Colors.lightBlue,
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Text("Caso não possua conta, cadastre-se!", style: TextStyle(color: Colors.black),),
                    onTap: (){
                      Navigator.pushNamed(context, "Cadastro");
                    },
                  ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
