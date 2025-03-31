import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(JokenpoApp(title: 'Jogo Jokenpo'));
}

class JokenpoApp extends StatelessWidget {
  final String title;

  const JokenpoApp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData.dark(),
      home: JokenpoScreen(),
    );
  }
}

class JokenpoScreen extends StatefulWidget {
  const JokenpoScreen({super.key});

  @override
  _JokenpoScreenState createState() => _JokenpoScreenState();
}

class _JokenpoScreenState extends State<JokenpoScreen> {
  final List<String> opcoes = ["Pedra", "Papel", "Tesoura"];
  final Map<String, String> imagens = {
    "Pedra": "assets/images/pedra.png",
    "Papel": "assets/images/papel.png",
    "Tesoura": "assets/images/tesoura.png",
  };

  String? escolhaJogador;
  String? escolhaMaquina;
  String resultado = "";

  int pontosJogador = 0;
  int pontosMaquina = 0;
  String? mensagemResultado;

  void jogar(String escolha) {
    setState(() {
      escolhaJogador = escolha;
      escolhaMaquina = opcoes[Random().nextInt(3)];
      resultado = verificarResultado(escolhaJogador!, escolhaMaquina!);
    });

    print("Escolha do Jogador: $escolhaJogador");
    print("Escolha da Máquina: $escolhaMaquina");
    print("Resultado: $resultado");
  }

  String verificarResultado(String jogador, String maquina) {
    if (jogador == maquina) {
      mensagemResultado = "Empate!";
      return "Empate!";
    }
    if ((jogador == "Pedra" && maquina == "Tesoura") ||
        (jogador == "Papel" && maquina == "Pedra") ||
        (jogador == "Tesoura" && maquina == "Papel")) {
      setState(() {
        pontosJogador++;
      });
      mensagemResultado = "Você venceu!";
      return "Você venceu!";
    }
    setState(() {
      pontosMaquina++;
    });
    mensagemResultado = "Você perdeu!";
    return "Você perdeu!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jokenpô")),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Escolha sua jogada:",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          opcoes.map((opcao) {
                            return GestureDetector(
                              onTap: () => jogar(opcao),
                              child: Container(
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color:
                                      escolhaJogador == opcao
                                          ? Colors.blueAccent
                                          : Colors.grey[700],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(imagens[opcao]!, width: 80),
                                    SizedBox(height: 5),
                                    Text(
                                      opcao,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed:
                          escolhaJogador != null
                              ? () {
                                setState(() {
                                  jogar(escolhaJogador!);
                                });
                              }
                              : null,
                      child: Text("JOGAR"),
                    ),
                    SizedBox(height: 20),
                    if (escolhaJogador != null && escolhaMaquina != null) ...[
                      Text("Máquina escolheu:", style: TextStyle(fontSize: 18)),
                      Image.asset(imagens[escolhaMaquina!]!, width: 100),
                    ],
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Adiciona o espaço para as mensagens de resultado
                    if (mensagemResultado != null) ...[
                      Text(
                        mensagemResultado!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color:
                              mensagemResultado == "Você venceu!"
                                  ? Colors.green
                                  : (mensagemResultado == "Empate!"
                                      ? Colors.yellow
                                      : Colors.red),
                        ),
                      ),
                      SizedBox(height: 50), // Espaço de 5 linhas
                    ],
                    Text(
                      "Pontos",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Jogador: $pontosJogador",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Máquina: $pontosMaquina",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
