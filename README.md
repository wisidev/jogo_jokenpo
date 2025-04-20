# Jogo Jokenpo

Este projeto implementa um jogo simples de Jokenpô (Pedra, Papel, Tesoura) utilizando Flutter. O jogo permite que o usuário escolha entre as três opções e compete contra a máquina, mostrando o resultado em tempo real e pontuação atualizada.

## Descrição

O jogo é um aplicativo Flutter simples onde o jogador escolhe entre três opções: Pedra, Papel e Tesoura, e a máquina escolhe aleatoriamente uma dessas opções. O resultado do jogo é mostrado na tela, incluindo o vencedor, a escolha do jogador, a escolha da máquina e a pontuação.

## Funcionalidades

- **Escolha do Jogador**: O jogador pode selecionar uma das opções (Pedra, Papel ou Tesoura).
- **Escolha da Máquina**: A máquina escolhe aleatoriamente uma das opções.
- **Resultado**: O aplicativo determina o vencedor com base nas escolhas feitas e exibe a mensagem correspondente ("Você venceu!", "Você perdeu!" ou "Empate!").
- **Pontuação**: O jogo mantém a pontuação de ambos, jogador e máquina, atualizada a cada rodada.
- **Interface**: O design é responsivo, permitindo que o jogo seja jogado em várias plataformas com uma interface de usuário simples e intuitiva.

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento de aplicativos móveis.
- **Dart**: Linguagem de programação usada para desenvolver o aplicativo.
- **Material Design**: Interface baseada em Material Design para a construção da interface gráfica.

## Arquivos principais
- **lib/main.dart**: Contém o código principal do aplicativo Flutter, incluindo a interface do usuário e a lógica de jogo.
- **assets/images/**: Contém as imagens utilizadas para representar as opções do jogo (Pedra, Papel e Tesoura).

## Dependências

- **flutter**: SDK do Flutter.
- **cupertino_icons**: Pacote para ícones no estilo iOS.
- **flutter_lints**: Lints recomendadas para manter boas práticas de codificação no Flutter.

## Como Rodar o Projeto

1. Instale o Flutter em sua máquina, caso não tenha instalado.
- [Instalação do Flutter](https://docs.flutter.dev/get-started/install)
2. Clone o repositório do projeto para sua máquina local.

   ```bash
   git clone https://github.com/wisidev/jogo_jokenpo.git
   ```

3. Abra o projeto no seu editor de código preferido, como o Visual Studio Code ou Android Studio.
4. Navegue até o diretório do projeto e instale as dependências com o comando:

   ```bash
   flutter pub get
   ```

5. Para rodar o aplicativo, execute o seguinte comando:

   ```bash
   flutter run
   ```
   
6. Jogue!
- O jogador pode escolher uma das três opções: Pedra, Papel ou Tesoura.
- O aplicativo mostrará a escolha da máquina, o resultado da rodada e atualizará a pontuação.
