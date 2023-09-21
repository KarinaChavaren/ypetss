import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaChat(),
  ));
}

class TelaChat extends StatefulWidget {
  @override
  State createState() => EstadoTelaChat();
}

class EstadoTelaChat extends State<TelaChat> {
  final TextEditingController _controladorTexto = TextEditingController();
  final List<String> _mensagens = [];
  String _remetente = "Você";


  void _enviarMensagem(String mensagem) {
    if (mensagem.isNotEmpty) {
      setState(() {
        _mensagens.add('$_remetente: $mensagem');
        _controladorTexto.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 78, 50, 83),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _mensagens.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: _remetente == "Você"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Text(_mensagens[index] ?? ''),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controladorTexto,
                    decoration: InputDecoration(
                      hintText: 'Digite sua mensagem...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _enviarMensagem(_controladorTexto.text);
                  },
                ),
                DropdownButton<String>(
                  value: _remetente,
                  onChanged: (String? novoValor) {
                    setState(() {
                      _remetente = novoValor ?? "Você";
                    });
                  },
                  items: <String>['Você', 'Outra Pessoa']
                      .map<DropdownMenuItem<String>>(
                    (String valor) {
                      return DropdownMenuItem<String>(
                        value: valor,
                        child: Text(valor),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}