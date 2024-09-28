import 'package:flutter/material.dart';
import 'repositories/repositorio_contato.dart';
import 'screens/cadastro_contato.dart';
import 'screens/lista_contatos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda de Contatos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ContatoRepository _contatoRepository = ContatoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agenda de Contatos')),
      body: ListaContatos(
        contatos: _contatoRepository.getContatos(),
        onEdit: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastroContato(
                contato: _contatoRepository.getContatos()[index],
                onSave: (contato) {
                  setState(() {
                    _contatoRepository.atualizarContato(index, contato);
                  });
                },
              ),
            ),
          );
        },
        onDelete: (index) {
          setState(() {
            _contatoRepository.removerContato(index);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastroContato(
                onSave: (contato) {
                  setState(() {
                    _contatoRepository.adicionarContato(contato);
                  });
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
