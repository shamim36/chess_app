import 'package:chess_app/helper/helper_method.dart';
import 'package:chess_app/main_screens/about_screen.dart';
import 'package:chess_app/main_screens/game_time_screen.dart';
import 'package:chess_app/main_screens/settings_screen.dart';
import 'package:chess_app/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final gameProvider = context.read<GameProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // elevation: 5,
        title: const Text(
          'Chess Game',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            buildGameType(
              label: 'Player vs Computer',
              icon: Icons.computer,
              onTap: () {
                gameProvider.setVsComputer(value: true);
                //navigate to setup game time screen

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameTimeScreeen(),
                  ),
                );
              },
            ),
            buildGameType(
              label: 'Play With Friend',
              icon: Icons.group,
              onTap: () {
                gameProvider.setVsComputer(value: false);

                //navigate to setup game time screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameTimeScreeen(),
                  ),
                );
              },
            ),
            buildGameType(
              label: 'Settings',
              icon: Icons.settings,
              onTap: () {
                // nanvigate to setting screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
            buildGameType(
              label: 'About',
              icon: Icons.info,
              onTap: () {
                //navigate to about screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
