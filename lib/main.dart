// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final audioPlayer = AudioPlayer();
  double volume = 0.5;

  executar() async {
    await audioPlayer.play(AssetSource('audios/musica.mp3'));
  }

  pausar() async {
    await audioPlayer.pause();
  }

  parar() async {
    await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Executando sons",
        ),
      ),
      body: Column(
        children: [
          Slider(
            value: volume,
            min: 0.0,
            max: 1.0,
            onChanged: (novoVolume) {
              setState(() {
                volume = novoVolume;
              });
              audioPlayer.setVolume(volume);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: executar,
                    child: Image.asset('assets/imagens/executar.png')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: pausar,
                    child: Image.asset('assets/imagens/pausar.png')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: parar,
                    child: Image.asset('assets/imagens/parar.png')),
              ),
            ],
          )
        ],
      ),
    );
  }
}
