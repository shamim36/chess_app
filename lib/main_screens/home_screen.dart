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
      body: GridView.count(
        crossAxisCount: 2,
        children:const [
          Card(
            child: Center(
              child: Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children: [
                  Icon(Icons.computer),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Player vs Computer'),
                ],
              ),
            ),
          ),
          Card(
            child: Center(
              child: Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children: [
                  Icon(Icons.group),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Play With Frind'),
                ],
              ),
            ),
          ),
          Card(
            child: Center(
              child: Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Settings'),
                ],
              ),
            ),
          ),
          Card(
            child: Center(
              child: Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children: [
                  Icon(Icons.info),
                  SizedBox(
                    height: 10,
                  ),
                  Text('About'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
