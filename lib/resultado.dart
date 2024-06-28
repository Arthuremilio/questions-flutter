import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final List<String> resultados;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.resultados, this.quandoReiniciarQuestionario);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Obrigado, você respondeu respectivamente:',
                style: TextStyle(fontSize: 16),
              ),
              ...resultados
                  .map((resposta) => Text(
                        resposta,
                        style: TextStyle(fontSize: 14),
                      ))
                  .toList(),
            ],
          ),
        ),
        TextButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
