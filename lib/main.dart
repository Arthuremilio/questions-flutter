import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var resultados = <String>[];
  var respostaEscolhida = '';
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'cor': 'azul'},
        {'texto': 'Vermelho', 'cor': 'vermelho'},
        {'texto': 'Rosa', 'cor': 'rosa'},
        {'texto': 'Amarelo', 'cor': 'amarelo'},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cavalo', 'cor': 'marrom'},
        {'texto': 'Leão', 'cor': 'beje'},
        {'texto': 'Tigre', 'cor': 'laranja'},
        {'texto': 'Macaco', 'cor': 'preto'},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Gustavo Guanabara', 'cor': 'laranja'},
        {'texto': 'Luiz Otávio', 'cor': 'amarelo'},
        {'texto': 'Leonardo Moura', 'cor': 'Azul'},
        {'texto': 'Lucimar Sasso', 'cor': 'verde'},
      ],
    },
  ];

  void _responder(String respostaEscolhida) {
    setState(() {
      _perguntaSelecionada++;
      resultados.add(respostaEscolhida);
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      resultados.clear();
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    const String titulo = 'Perguntas';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
              width: double.infinity,
              child: Text(
                titulo,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )),
          backgroundColor: Color.fromARGB(255, 1, 132, 255),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(resultados, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
