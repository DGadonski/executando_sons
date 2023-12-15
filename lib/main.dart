// ignore_for_file: prefer_const_constructors

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

  // executardaWeb() async {
  //   String url =
  //       "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3";
  //   await audioPlayer.play(UrlSource(url));
  // }

  executar() async {
    await audioPlayer.play(AssetSource('audios/musica.mp3'), volume: 50.0);
  }

  @override
  Widget build(BuildContext context) {
    // executardaWeb();
    executar();

    return Container();
  }
}
