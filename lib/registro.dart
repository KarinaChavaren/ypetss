import 'package:flutter/material.dart';
import 'package:flutter_ypets/formulario.dart';
import 'package:flutter_ypets/main.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PaginaRegistro(),
  ));
}

class PaginaRegistro extends StatefulWidget {
  @override
  EstadoPaginaRegistro createState() => EstadoPaginaRegistro();
}

class EstadoPaginaRegistro extends State<PaginaRegistro> {
  final GlobalKey<FormState> _chaveForm = GlobalKey<FormState>();

  String _email = "";
  String _senha = "";
  bool _estaRegistrando = false;

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 78, 50, 83),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _chaveForm,
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
                  "Registrar",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (entrada) {
                    if (entrada!.isEmpty) {
                      return "Insira um email válido";
                    }
                    return null;
                  },
                  onSaved: (entrada) => _email = entrada!,
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Senha"),
                  validator: (entrada) {
                    if (entrada!.length < 6) {
                      return "A senha deve ter pelo menos 6 caracteres";
                    }
                    return null;
                  },
                  onSaved: (entrada) => _senha = entrada!,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _estaRegistrando
                      ? null
                      : () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PaginaLogin()));
                        },
                  child: _estaRegistrando
                      ? CircularProgressIndicator()
                      : Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
