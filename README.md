# ✅ Case-Keener.io

Case Técnico para Vaga de Desenvolvedor Mobile com Flutter

O projeto é uma aplicação em Flutter que simula um pequeno sistema de gestão de tarefas.

[Assista ao vídeo de demonstração](https://youtu.be/DdDkdKK2j24)

## 💻 Pré-requisitos

Para executar este projeto Flutter, certifique-se de que seu ambiente de desenvolvimento esteja configurado corretamente, seguindo os passos abaixo.

### 1. Instale o Flutter SDK

- Baixe e instale o [Flutter SDK](https://flutter.dev/docs/get-started/install) de acordo com seu sistema operacional.
- Após a instalação, adicione o Flutter ao seu PATH para que os comandos do Flutter possam ser executados no terminal.

### 2. Instale o Android Studio

- Para desenvolvimento e debugging, o **Android Studio** é recomendado.
  - Baixe o [Android Studio](https://developer.android.com/studio) e instale-o.
  - Abra o Android Studio e instale o **Android SDK** e o **Android Virtual Device (AVD)**, que são necessários para testar o app em emuladores.
  - No Android Studio, verifique se o **plugin Flutter** está instalado (você pode instalá-lo na aba de plugins caso necessário).

### 3. Configure um Emulador ou Conecte um Dispositivo Físico

- Para rodar o aplicativo, você pode:
  - Configurar um **Emulador Android** pelo Android Studio.
  - Conectar um **dispositivo físico** via USB e habilitar a depuração USB no dispositivo (em "Opções do Desenvolvedor").

### 4. Verifique a Configuração

- Use o comando abaixo para verificar se o Flutter está configurado corretamente:
  ```bash
  flutter doctor
  ```

## 🚀 Como rodar o Projeto

1. Crie um projeto no Firebase: Primeiramente, crie um projeto no Firebase. Em seguida, faça login no Firebase CLI para que o terminal reconheça seus projetos.

2. Instale as dependências do projeto: Abra o terminal no diretório do projeto e execute o comando abaixo para instalar todas as dependências:

   ```
   flutter pub get
   ```

3. Configure o Firebase: Para configurar o Firebase no seu projeto, execute:

   ```
   flutterfire configure
   ```

4. Execute o projeto: Com os comandos acima já executados e um dispositivo Android conectado, rode o comando abaixo ou pressione a tecla F5:

   ```
   flutter run
   ```

5. Criação da Coleção "tasks": No Firebase Firestore, crie uma coleção chamada "tasks" para evitar problemas no funcionamento do aplicativo.
