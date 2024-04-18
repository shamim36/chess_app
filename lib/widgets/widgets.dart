import 'package:flutter/material.dart';

import '../constant.dart';

class PlayerColorRadioButton extends StatelessWidget {
  const PlayerColorRadioButton(
      {super.key,
      required this.title,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  final String title;
  final PlayerColor value;
  final PlayerColor? groupValue;
  final Function(PlayerColor?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<PlayerColor>(
      title: Text(title),
      value: value,
      dense: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.zero,
      tileColor: Colors.grey[300],
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}

class BuildCustomTime extends StatelessWidget {
  const BuildCustomTime({
    super.key,
    required this.time,
    required this.onLeftArrowClicked,
    required this.onRightArrowClicked,
  });

  final int time;
  final Function() onLeftArrowClicked;
  final Function() onRightArrowClicked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onLeftArrowClicked,
          icon: const Icon(Icons.arrow_back_ios),
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
                '$time',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: onRightArrowClicked,
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
