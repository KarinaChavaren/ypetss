import 'package:flutter/material.dart';
import 'package:flutter_ypets/chat.dart';
import 'package:flutter_ypets/formulario.dart';

void main() {
  runApp(ListaAdocoes());
}

class ListaAdocoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Adoções',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaListaAdocoes(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaListaAdocoes extends StatefulWidget {
  @override
  EstadoTelaListaAdocoes createState() => EstadoTelaListaAdocoes();
}

class EstadoTelaListaAdocoes extends State<TelaListaAdocoes> {
  List<String> _idsDocumentosFavoritos = [];
  int _indiceSelecionado = 0;

  List<String> imagens = [
    'poodle.jpg',
    'caramelo.jpg',
    'siames.jpg',
    'betta.jpg',   
  ];

  List<String> racas = [
    'Poodle',
    'Vira-lata',
    'Siames',
    'Peixe Beta',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 78, 50, 83),
      ),
      body: ListView.builder(
        itemCount: imagens.length,
        itemBuilder: (context, index) {
     
          return ListTile(
            leading: CircleAvatar(
         
              radius: 30,
              backgroundImage: AssetImage('test/assets/${imagens[index]}'),
            ),
            title: Text('Animal ${index + 1} para Adoção'),
            subtitle: Text('Gênero: ${index % 2 == 0 ? 'Macho' : 'Fêmea'} | Raça: ${racas[index]}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    _idsDocumentosFavoritos.contains(index.toString())
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                   
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.message,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TelaChat()));
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Adoções Cadastradas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Formulário de Adoção',
          ),
        ],
        currentIndex: _indiceSelecionado,
        onTap: (indice) {
          setState(() {
            _indiceSelecionado = indice;
            if (indice == 2) {
              Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TelaFormularioAdocao()));
            }
          });
        },
      ),
    );
  }
}