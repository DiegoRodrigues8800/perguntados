import 'package:flutter/material.dart';
import 'package:perguntados/questao.dart';

void main() => runApp(const PerguntadosApp());

class PerguntadosApp extends StatefulWidget {
  const PerguntadosApp({super.key});

  @override
  State<PerguntadosApp> createState() => _PerguntadosAppState();
}

class _PerguntadosAppState extends State<PerguntadosApp> {
  final _perguntaSelecionada = 0;
  final _pontuacaoTotal = 0;

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

  void responder() {
    setState(() {
      if (perguntaSelecionada >= perguntas.length - 1) {
        perguntaSelecionada = 0;
      } else {
        perguntaSelecionada++;
      }
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntados"),
        ),
        body: Column(
          children: [
            // PERGUNTA
            Questao(
                perguntas: perguntas, perguntaSelecionada: perguntaSelecionada),
            //RESPOSTA 1
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: responder,
                child: const Text("Pergunta 1"),
              ),
            ),
            //RESPOSTA 2
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  print("Resposta 2");
                },
                child: const Text("Pergunta 2"),
              ),
            ),
            //RESPOSTA 3
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => print("Resposta 3"),
                child: const Text("Pergunta 3"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
