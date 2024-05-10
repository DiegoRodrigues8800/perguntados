import 'package:flutter/material.dart';
import 'package:perguntados/questionario.dart';
import 'package:perguntados/resultado.dart';

void main() => runApp(const PerguntadosApp());

class PerguntadosApp extends StatefulWidget {
  const PerguntadosApp({super.key});

  @override
  State<PerguntadosApp> createState() => _PerguntadosAppState();
}

class _PerguntadosAppState extends State<PerguntadosApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      "texto": "Qual seu time?",
      "respostas": [
        {"texto": "Gremio", "pontuacao": 5},
        {"texto": "Inter", "pontuacao": 10},
        {"texto": "Corintians", "pontuacao": 1},
      ],
    },
    {
      "texto": "Qual seu animal favorito?",
      "respostas": [
        {"texto": "Gato", "pontuacao": 1},
        {"texto": "Cachorro", "pontuacao": 5},
        {"texto": "Vaca", "pontuacao": 10},
        {"texto": "Pato", "pontuacao": 3},
      ],
    },
    {
      "texto": "O Palmeiras de mundial?",
      "respostas": [
        {"texto": "Sim", "pontuacao": 1},
        {"texto": "Não", "pontuacao": 10},
      ],
    },
    {
      "texto": "Qual seu gênero",
      "respostas": [
        {"texto": "Masculino", "pontuacao": 10},
        {"texto": "Feminino", "pontuacao": 10},
      ],
    },
  ];

  var perguntaSelecionada = 0;

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntados"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(
                _pontuacaoTotal,
                _reiniciarQuestionario,
              ),
      ),
    );
  }
}
