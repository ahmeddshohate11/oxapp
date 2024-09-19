import 'package:flutter/material.dart';
import 'package:oxapp/widgets/board_header.dart';
import 'package:oxapp/widgets/boardbutton.dart';
   
class BoardScreen extends StatefulWidget {
  static const String routeName = 'board';

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}


class _BoardScreenState extends State<BoardScreen> {
  List<String> boardState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int Player1Score = 0;
  int Player2Score = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'OX GAME',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Expanded(child: BoardHeader(Player1Score, Player2Score)),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Boardbutton(boardState[0], onUserClick, 0),
                  Boardbutton(boardState[1], onUserClick, 1),
                  Boardbutton(boardState[2], onUserClick, 2),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Boardbutton(boardState[3], onUserClick, 3),
                  Boardbutton(boardState[4], onUserClick, 4),
                  Boardbutton(boardState[5], onUserClick, 5),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Boardbutton(boardState[6], onUserClick, 6),
                  Boardbutton(boardState[7], onUserClick, 7),
                  Boardbutton(boardState[8], onUserClick, 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int counter = 0;
  void onUserClick(int position) {
    if (boardState[position].isNotEmpty) {
      return;
    }
    setState(() {
      if (counter % 2 == 0) {
        boardState[position] = 'x';
        Player1Score++;
      } else {
        boardState[position] = 'o';
        Player2Score++;
      }
      counter++;

      if (checkWinner('x')) {
        // show message winner 
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Player X wins!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetBoard();
                  Player1Score += 5;
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else if (checkWinner('o')) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Player O wins!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetBoard();
                   Player2Score += 5;
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else if (counter == 9) {
        // Check for draw
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('It\'s a draw!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetBoard();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  void resetBoard() {
    setState(() {
      boardState = [
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
      ];
      counter = 0;
      Player1Score = 0; // Reset Player1Score
      Player2Score = 0; // Reset Player2Score
    });
  }

  bool checkWinner(String player) {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == player &&
          boardState[i + 1] == player &&
          boardState[i + 2] == player) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == player &&
          boardState[i + 3] == player &&
          boardState[i + 6] == player) {
        return true;
      }
    }

    // Check diagonals
    if (boardState[0] == player &&
        boardState[4] == player &&
        boardState[8] == player) {
      return true;
    }
    if (boardState[2] == player &&
        boardState[4] == player &&
        boardState[6] == player) {
      return true;
    }

    return false;
  }
}






//   if (boardState[3] == player &&
  //       boardState[4] == player &&
  //       boardState[5] == player) {
  //     return true;
  //   }
  //   if (boardState[6] == player &&
  //       boardState[7] == player &&
  //       boardState[8] == player) {
  //     return true;
  //   }
  //   if (boardState[0] == player &&
  //       boardState[3] == player &&
  //       boardState[6] == player) {
  //     return true;
  //   }
  //   if (boardState[1] == player &&
  //       boardState[4] == player &&
  //       boardState[7] == player) {
  //     return true;
  //   }
  //   if (boardState[2] == player &&
  //       boardState[5] == player &&
  //       boardState[8] == player) {
  //     return true;
  //   }
  // }