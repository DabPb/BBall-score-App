import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ScoreCard extends StatefulWidget {
  final String? teamName;
  final int? score;
  final Function? score1Click;
  final Function? score2Click;
  final Function? score3Click;

  const ScoreCard(
      {Key? key,
      required this.teamName,
      required this.score,
      required this.score1Click,
      required this.score2Click,
      required this.score3Click})
      : super(key: key);

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.teamName!,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              height: 180,
              alignment: Alignment.center,
              child: AutoSizeText(
                '${widget.score}',
                style: const TextStyle(fontSize: 200, fontWeight: FontWeight.w400),
                maxLines: 2,
              )),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () => widget.score1Click!(),
            style: ElevatedButton.styleFrom(primary: Colors.orange),
            child: const Text(
              'Add 1 point',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          ElevatedButton(
            onPressed: () => widget.score2Click!(),
            style: ElevatedButton.styleFrom(primary: Colors.orange),
            child: const Text(
              'Add 2 point',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          ElevatedButton(
            onPressed: () => widget.score3Click!(),
            style: ElevatedButton.styleFrom(primary: Colors.orange),
            child: const Text(
              'Add 3 point',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ]);
  }

  double setFont(int score) {
    if (score < 99) {
      return 120;
    } else if (score < 999) {
      return 80;
    } else {
      return 40;
    }
  }
}
