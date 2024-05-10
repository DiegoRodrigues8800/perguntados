import 'package:flutter/material.dart';
import 'package:perguntados/questao.dart';
import 'package:perguntados/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntSelecionada;
  final void Function(int) quandoResponder;

  const Questionario({
    required this.perguntas,
    required this.perguntSelecionada,
    required this.quandoResponder,
    super.key,
  });

  bool get temPerguntaSelecionada {
    return perguntSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntSelecionada]["texto"] as String),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'] as String,
            () => quandoResponder(resp['pontuacao'] as int),
          );
        }),
      ],
    );
  }
}
