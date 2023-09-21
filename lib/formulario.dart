import 'package:flutter/material.dart';
import 'package:flutter_ypets/main.dart';

void main() {
  runApp(MeuApp());
}

class FormularioAdocao {
  late String genero;
  late int idade;
  late String nome;
  late String telefone;
  late String descricao;
  late String intituicao;
  late String raca;
  //late String SupoIdade;

  FormularioAdocao({
    required this.genero,
    required this.idade,
    required this.nome,
    required this.telefone,
    required this.descricao,
    required this.intituicao,
    required this.raca,
    //required this.SupoIdade,
  });
}

class TelaFormularioAdocao extends StatefulWidget {
  @override
  TelaFormularioAdocaoState createState() => TelaFormularioAdocaoState();
}

class TelaFormularioAdocaoState extends State<TelaFormularioAdocao> {
  final _formKey = GlobalKey<FormState>();
  late FormularioAdocao _formularioAdocao = FormularioAdocao(
    genero: '',
    idade: 0,
    nome: '',
    telefone: '',
    descricao: '',
    intituicao: '',
    raca: '',
    //SupoIdade: '',
  );

  String imageUrl = '';
  bool MachoSelecionado = false;
  bool FemeaSelecionado = false;
  String SeleIdade = 'Meses';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 78, 50, 83),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Se você não sabe alguma informação escreva N/S',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              Text(
                'Sexo do animal',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: MachoSelecionado,
                    onChanged: (newValue) {
                      setState(() {
                        MachoSelecionado = newValue!;
                        if (newValue) {
                          FemeaSelecionado = false;
                          _formularioAdocao.genero = 'Masculino';
                        }
                      });
                    },
                  ),
                  Text('Masculino'),
                  SizedBox(width: 20),
                  Checkbox(
                    value: FemeaSelecionado,
                    onChanged: (newValue) {
                      setState(() {
                        FemeaSelecionado = newValue!;
                        if (newValue) {
                          MachoSelecionado = false;
                          _formularioAdocao.genero = 'Feminino';
                        }
                      });
                    },
                  ),
                  Text('Feminino'),
                ],
              ),
              Row(
                children: [
                  Text('Idade'),
                  SizedBox(width: 20),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Idade'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a idade';
                        }
                        return null;
                      },
                    ),
                  ),
                  DropdownButton<String>(
                    value: SeleIdade,
                    onChanged: (String? newValue) {
                      setState(() {
                        SeleIdade = newValue!;
                      });
                    },
                    items: <String>['Meses', 'Anos', 'Dias']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              /* TextFormField(
                decoration: InputDecoration(labelText: 'Idade Suposta'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a suposta idade caso não souber';
                  }
                  return null;
                },
              ), */
              TextFormField(
                decoration: InputDecoration(labelText: 'Raça do animal'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a raça';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a descrição';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Instituição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a instituição/ quem quer doar';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL da Imagem'),
                onChanged: (value) {
                  setState(() {
                    imageUrl = value;
                  });
                },
              ),
              if (imageUrl.isNotEmpty)
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Image.network(imageUrl),
                ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MeuApp()));
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário de Adoção',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaFormularioAdocao(),
      debugShowCheckedModeBanner: false,
    );
  }
}
