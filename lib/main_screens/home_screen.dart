import 'package:chess_app/main_screens/game_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GameScreen()),
                );
              },
            ),
            buildGameType(
              label: 'Play With Friend',
              icon: Icons.group,
              onTap: () {},
            ),
            buildGameType(
              label: 'Settings',
              icon: Icons.settings,
              onTap: () {},
            ),
            buildGameType(
              label: 'About',
              icon: Icons.info,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildGameType(
    {required String label,
    String? gameTime,
    IconData? icon,
    required Function() onTap}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? Icon(icon) : Text(gameTime!),
            const SizedBox(
              height: 10,
            ),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
