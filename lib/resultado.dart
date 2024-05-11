import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestioanario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestioanario,
      {super.key});

  String get fraseResultado {
    if (pontuacao < 20) {
      return "Ferro";
    } else if (pontuacao < 25) {
      return "Platina";
    } else if (pontuacao < 30) {
      return "Immortal";
    } else {
      return "Radiante";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        Center(
          child: Text(
            "Pontuação: $pontuacao Pontos!",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestioanario,
          child: const Text(
            "Reiniciar?",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
