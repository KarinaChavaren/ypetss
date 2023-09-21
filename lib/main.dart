import 'package:flutter/material.dart';
import 'package:flutter_ypets/formulario.dart';
import 'package:flutter_ypets/lista.dart';
import 'package:flutter_ypets/main.dart';
import 'package:flutter_ypets/registro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PaginaLogin(),
  ));
}

class PaginaLogin extends StatefulWidget {
  @override
  EstadoPaginaLogin createState() => EstadoPaginaLogin();
}

class EstadoPaginaLogin extends State<PaginaLogin> {
  TextEditingController _controladorEmail = TextEditingController();
  TextEditingController _controladorSenha = TextEditingController();
  bool _estahFazendoLogin = false;

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 78, 50, 83),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'test/assets/logo.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              Text(
                "Logar",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _controladorEmail,
                decoration: InputDecoration(labelText: 'E-mail'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _controladorSenha,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _estahFazendoLogin
                    ? null
                    : () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ListaAdocoes()));
                      },
                child: _estahFazendoLogin
                    ? CircularProgressIndicator()
                    : Text('Entrar'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  print('Registrar');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PaginaRegistro()));
                },
                child: Text('Registrar-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}