import 'package:flutter/material.dart';
import '../models/contato.dart';

class ListaContatos extends StatelessWidget {
  final List<Contato> contatos;
  final Function(int) onEdit;
  final Function(int) onDelete;

  ListaContatos(
      {required this.contatos, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contatos.length,
      itemBuilder: (context, index) {
        final contato = contatos[index];
        return ListTile(
          title: Text(contato.nome),
          subtitle: Text('${contato.telefone}\n${contato.email}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => onEdit(index),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => onDelete(index),
              ),
            ],
          ),
        );
      },
    );
  }
}
