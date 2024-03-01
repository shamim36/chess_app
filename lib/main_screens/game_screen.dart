import 'dart:math';

import 'package:bishop/bishop.dart' as bishop;
import 'package:chess_app/service/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:square_bishop/square_bishop.dart';
import 'package:squares/squares.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late bishop.Game game;
  late SquaresState state;
  int player = Squares.white;
  bool aiThinking = false;
  bool flipBoard = false;

  @override
  void initState() {
    _resetGame(false);
    super.initState();
  }

  void _resetGame([bool ss = true]) {
    game = bishop.Game(variant: bishop.Variant.standard());
    state = game.squaresState(player);
    if (ss) setState(() {});
  }

  void _flipBoard() => setState(() => flipBoard = !flipBoard);

  void _onMove(Move move) async {
    bool result = game.makeSquaresMove(move);
    if (result) {
      setState(() => state = game.squaresState(player));
    }
    if (state.state == PlayState.theirTurn && !aiThinking) {
      setState(() => aiThinking = true);
      await Future.delayed(
          Duration(milliseconds: Random().nextInt(4750) + 250));
      game.makeRandomMove();
      setState(() {
        aiThinking = false;
        state = game.squaresState(player);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO : show dialog if sure
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        // elevation: 5,
        title: const Text(
          'Chess Game',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          const SizedBox(height: 32),
          IconButton(
            onPressed: _resetGame,
            icon: const Icon(
              Icons.start,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: _flipBoard,
            icon: const Icon(
              Icons.rotate_left,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //opponent data
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AssetsManager.stockfishIcon),
              ),
              title: Text('StockFish'),
              subtitle: Text('Rating: 3000'),
              trailing: Text('05:00'),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: BoardController(
                state: flipBoard ? state.board.flipped() : state.board,
                playState: state.state,
                pieceSet: PieceSet.merida(),
                theme: BoardTheme.brown,
                moves: state.moves,
                onMove: _onMove,
                onPremove: _onMove,
                markerTheme: MarkerTheme(
                  empty: MarkerTheme.dot,
                  piece: MarkerTheme.corners(),
                ),
                promotionBehaviour: PromotionBehaviour.autoPremove,
              ),
            ),

            //our data
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AssetsManager.userIcon),
              ),
              title: Text('User775'),
              subtitle: Text('Rating: 1200'),
              trailing: Text('05:00'),
            ),
          ],
        ),
      ),
    );
  }
}
