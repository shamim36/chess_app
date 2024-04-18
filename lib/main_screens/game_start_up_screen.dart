import 'package:flutter/material.dart';

import '../constant.dart';
import '../widgets/widgets.dart';

class GameStartUpScreen extends StatefulWidget {
  const GameStartUpScreen(
      {super.key, required this.isCustomTime, required this.gameTime});

  final bool isCustomTime;
  final String gameTime;

  @override
  State<GameStartUpScreen> createState() => _GameStartUpScreenState();
}

class _GameStartUpScreenState extends State<GameStartUpScreen> {
  PlayerColor playerColorGroup = PlayerColor.white;

  int whiteTimeInMinutes = 0;
  int blackTimeInMinutes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Setup Game',
          style: TextStyle(color: Colors.white),
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
        child: Column(
          children: [
            //radioListTile
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: PlayerColorRadioButton(
                    title: 'Play as ${PlayerColor.white.name}',
                    value: PlayerColor.white,
                    groupValue: playerColorGroup,
                    onChanged: (value) {
                      setState(() {
                        playerColorGroup = value!;
                      });
                      print('value1 $value');
                    },
                  ),
                ),
                widget.isCustomTime
                    ? BuildCustomTime(
                        time: whiteTimeInMinutes,
                        onLeftArrowClicked: () {
                          setState(() {
                            if (whiteTimeInMinutes != 0) {
                              whiteTimeInMinutes--;
                            }
                          });
                        },
                        onRightArrowClicked: (){
                          setState(() {
                            whiteTimeInMinutes++;
                          });
                        },
                      )
                    : Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Center(
                            child: Text(
                              widget.gameTime,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: PlayerColorRadioButton(
                    title: 'Play as ${PlayerColor.black.name}',
                    value: PlayerColor.black,
                    groupValue: playerColorGroup,
                    onChanged: (value) {
                      setState(() {
                        playerColorGroup = value!;
                      });
                      print('value2 $value');
                    },
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Center(
                      child: Text(
                        widget.gameTime,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
