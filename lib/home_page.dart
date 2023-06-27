import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:casino/casino_tiles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _status = 'Appuyez sur le bouton pour jouer';
  ConfettiController? _controller;
  final List<int> _numberOut = <int>[
    Random().nextInt(6),
    Random().nextInt(6),
    Random().nextInt(6)
  ];

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 10));
  }

  void reloadCasino() {
    setState(() {
      _numberOut[0] = Random().nextInt(6);
      _numberOut[1] = Random().nextInt(6);
      _numberOut[2] = Random().nextInt(6);

      if (_numberOut[0] == _numberOut[1] && _numberOut[1] == _numberOut[2]) {
        _status = 'Jackpot !';
        _controller!.play();
      } else {
        _status = 'Tu as perdu, essaie encore !';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 500,
            left: 250,
            child: ConfettiWidget(
              confettiController: _controller!,
              blastDirectionality: BlastDirectionality.explosive,
              blastDirection: -(11 * pi / 6),
              emissionFrequency: 0.05,
              numberOfParticles: 200,
              maxBlastForce: 100,
              minBlastForce: 80,
              gravity: 0.1,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
                Colors.yellow,
                Colors.red,
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CasinoTiles(imageIndex: _numberOut[0]),
                    CasinoTiles(imageIndex: _numberOut[1]),
                    CasinoTiles(imageIndex: _numberOut[2]),
                  ],
                ),
                Text(
                  _status,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: reloadCasino,
        tooltip: 'Recharger',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
