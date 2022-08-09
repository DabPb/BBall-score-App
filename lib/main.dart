import 'package:bball/score_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Basketball points app',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numOfPointsTeamA = 0;
  int numOfPointsTeamB = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Basketball Points Counter',
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(),
                  // 1: FlexColumnWidth(),
                  1: FixedColumnWidth(10),
                  2: FlexColumnWidth()
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      ScoreCard(
                          teamName: 'Team A',
                          score: numOfPointsTeamA,
                          score1Click: () {
                            setState(() {
                              numOfPointsTeamA++;
                            });
                          },
                          score2Click: () {
                            setState(() {
                              numOfPointsTeamA += 2;
                            });
                          },
                          score3Click: () {
                            setState(() {
                              numOfPointsTeamA += 3;
                            });
                          }),
                      const SizedBox(
                        height: 400,
                        child: VerticalDivider(
                          color: Colors.grey,
                          thickness: 0.5,
                          width: 10,
                        ),
                      ),
                      ScoreCard(
                          teamName: 'Team B',
                          score: numOfPointsTeamB,
                          score1Click: () {
                            setState(() {
                              numOfPointsTeamB++;
                            });
                          },
                          score2Click: () {
                            setState(() {
                              numOfPointsTeamB += 2;
                            });
                          },
                          score3Click: () {
                            setState(() {
                              numOfPointsTeamB += 3;
                            });
                          })
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      numOfPointsTeamA = 0;
                      numOfPointsTeamB = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
