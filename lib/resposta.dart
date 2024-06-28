import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;
  final String cor;

  Resposta(this.texto, this.quandoSelecionado, this.cor);

  Color getColorFromString(String colorString) {
    switch (colorString.toLowerCase()) {
      case 'azul':
        return Colors.blue;
      case 'vermelho':
        return Colors.red;
      case 'rosa':
        return Colors.pink;
      case 'amarelo':
        return Colors.yellow;
      case 'marrom':
        return Colors.brown;
      case 'marrom':
        return Colors.brown;
      case 'beje':
        return Color.fromARGB(255, 255, 217, 112);
      case 'laranja':
        return Colors.orange;
      case 'preto':
        return Colors.black;
      case 'verde':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: getColorFromString(cor),
        ),
        child: Text(texto,
            style: TextStyle(
              color: Colors.white,
            )),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
