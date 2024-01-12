import 'package:flutter/material.dart';

void main() => runApp(TicTacToeApp());

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '井字遊戲',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicTacToeScreen(),
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  late List<List<String>> _board;
  late bool _isPlayer1Turn;
  late bool _gameStarted;
  late bool _gameOver;
  late int? _winningRow;
  late int? _winningCol;
  late bool _isHorizontal;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    setState(() {
      _board = List.generate(3, (_) => List.filled(3, ''));
      _isPlayer1Turn = true;
      _gameStarted = false;
      _gameOver = false;
      _winningRow = null;
      _winningCol = null;
      _isHorizontal = false;
    });
  }

  void _startGame() {
    setState(() {
      _initializeBoard();
      _gameStarted = true;
    });
  }

  void _makeMove(int row, int col) {
    if (!_gameOver && _board[row][col] == '') {
      setState(() {
        _board[row][col] = _isPlayer1Turn ? 'X' : 'O';
        _checkWinner();
        _isPlayer1Turn = !_isPlayer1Turn;
      });
    }
  }

  void _checkWinner() {
    // 檢查所有橫向
    for (int i = 0; i < 3; i++) {
      if (_board[i][0] != '' &&
          _board[i][0] == _board[i][1] &&
          _board[i][0] == _board[i][2]) {
        _showGameOverDialog('${_board[i][0]} wins!');
        _gameStarted = false;
        return;
      }
    }

    // 檢查所有縱向
    for (int i = 0; i < 3; i++) {
      if (_board[0][i] != '' &&
          _board[0][i] == _board[1][i] &&
          _board[0][i] == _board[2][i]) {
        _showGameOverDialog('${_board[0][i]} wins!');
        _gameStarted = false;
        return;
      }
    }

    // 檢查斜線
    if (_board[0][0] != '' &&
        _board[0][0] == _board[1][1] &&
        _board[0][0] == _board[2][2]) {
      _showGameOverDialog('${_board[0][0]} wins!');
      _gameStarted = false;
      return;
    }

    if (_board[0][2] != '' &&
        _board[0][2] == _board[1][1] &&
        _board[0][2] == _board[2][0]) {
      _showGameOverDialog('${_board[0][2]} wins!');
      _gameStarted = false;
      return;
    }

    // 檢查平局
    if (_isBoardFull()) {
      _showGameOverDialog('It\'s a draw!');
      _gameStarted = false;
      return;
    }
    if (_winningRow != null && _winningCol != null) {
      _gameOver = true;
    }
  }

  bool _isBoardFull() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_board[i][j] == '') {
          return false;
        }
      }
    }
    return true;
  }

  void _showGameOverDialog(String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: Text('Game Over'),
          content: Text(result),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _initializeBoard();
              },
              child: Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildGrid() {
    return Stack(
      children: [
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            int row = index ~/ 3;
            int col = index % 3;
            return GestureDetector(
              onTap: () {
                if (_gameStarted) {
                  _makeMove(row, col);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Text(
                    _board[row][col],
                    style: TextStyle(
                      fontSize: 40.0,
                      color: _board[row][col] == 'X' ? Colors.red : Colors.blue,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        if (_gameOver && _winningRow != null && _winningCol != null)
          CustomPaint(
            painter: WinningLinePainter(
              _winningRow!,
              _winningCol!,
              _isHorizontal,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('井字遊戲'),
      ),
      body: Column(
        children: <Widget>[
          if (!_gameStarted)
            ElevatedButton(
              onPressed: _startGame,
              child: Text('Start Game'),
            ),
          if (_gameStarted)
            Text(
              _isPlayer1Turn ? 'Current Player: X' : 'Current Player: O',
              style: TextStyle(
                fontSize: 20.0,
                color: _isPlayer1Turn ? Colors.red : Colors.blue,
              ),
            ),
          Expanded(
            child: Center(
              child: _buildGrid(),
            ),
          ),
        ],
      ),
    );
  }
}

class WinningLinePainter extends CustomPainter {
  final int row;
  final int col;
  final bool isHorizontal;

  WinningLinePainter(this.row, this.col, this.isHorizontal);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 10;

    double startX, startY, endX, endY;

    if (isHorizontal) {
      startX = 10.0;
      startY = (row * size.height / 3) + size.height / 6;
      endX = size.width - 10.0;
      endY = startY;
    } else {
      startX = (col * size.width / 3) + size.width / 6;
      startY = 10.0;
      endX = startX;
      endY = size.height - 10.0;
    }

    canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
