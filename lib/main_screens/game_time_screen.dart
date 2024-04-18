import 'package:chess_app/helper/helper_method.dart';
import 'package:chess_app/main_screens/game_start_up_screen.dart';
import 'package:chess_app/providers/game_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class GameTimeScreeen extends StatefulWidget {
  const GameTimeScreeen({super.key});

  @override
  State<GameTimeScreeen> createState() => _GameTimeScreeenState();
}

class _GameTimeScreeenState extends State<GameTimeScreeen> {
  @override
  Widget build(BuildContext context) {
    final gameProvider = context.read<GameProvider>();
    print('vs VALUE : ${gameProvider.vsComputer}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Choose Game Time',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
          ),
          itemCount: gameTimes.length,
          itemBuilder: (context, index) {
            // get the first word of the game time
            final String label = gameTimes[index].split(' ')[0];

            //get the second word from game time
            final String gameTime = gameTimes[index].split(' ')[1];

            return buildGameType(
              label: label,
              gameTime: gameTime,
              onTap: () {
                if (label == Constants.custom) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameStartUpScreen(
                        isCustomTime: true,
                        gameTime: gameTime,
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameStartUpScreen(
                        isCustomTime: false,
                        gameTime: gameTime,
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
