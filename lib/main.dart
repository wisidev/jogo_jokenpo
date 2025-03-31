import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(JokenpoApp(title: 'Jogo Jokenpo')); // Passa o título para o app
}

class JokenpoApp extends StatelessWidget {
  final String title;

  const JokenpoApp({
    super.key,
    required this.title,
  }); // Adiciona o título como parâmetro

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title, // Passa o título para o MaterialApp
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

  void jogar(String escolha) {
    setState(() {
      escolhaJogador = escolha;
      escolhaMaquina = opcoes[Random().nextInt(3)];
      resultado = verificarResultado(escolhaJogador!, escolhaMaquina!);
    });

    // Verificando os valores de escolhaJogador, escolhaMaquina e resultado
    print("Escolha do Jogador: $escolhaJogador");
    print("Escolha da Máquina: $escolhaMaquina");
    print("Resultado: $resultado");
  }

  String verificarResultado(String jogador, String maquina) {
    print("Verificando resultado... Jogador: $jogador, Máquina: $maquina");

    if (jogador == maquina) return "Empate!";
    if ((jogador == "Pedra" && maquina == "Tesoura") ||
        (jogador == "Papel" && maquina == "Pedra") ||
        (jogador == "Tesoura" && maquina == "Papel")) {
      return "Você venceu!";
    }
    return "Você perdeu!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jokenpô")),
      body: SingleChildScrollView(
        // Adiciona a rolagem
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Escolha sua jogada:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                Text("Você escolheu:", style: TextStyle(fontSize: 18)),
                Image.asset(imagens[escolhaJogador!]!, width: 100),
                Text("Máquina escolheu:", style: TextStyle(fontSize: 18)),
                Image.asset(imagens[escolhaMaquina!]!, width: 100),
                Text(
                  resultado,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
