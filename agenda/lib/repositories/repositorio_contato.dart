import '../models/contato.dart';

class ContatoRepository {
  List<Contato> contatos = [];

  List<Contato> getContatos() => contatos;

  void adicionarContato(Contato contato) {
    contatos.add(contato);
  }

  void removerContato(int index) {
    contatos.removeAt(index);
  }

  void atualizarContato(int index, Contato contato) {
    contatos[index] = contato;
  }
}
