import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestioanario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestioanario,
      {super.key});

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Ferro";
    } else if (pontuacao < 12) {
      return "Platina";
    } else if (pontuacao < 16) {
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
