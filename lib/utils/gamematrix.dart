import 'package:flutter/material.dart';

List<int> values = [2, 2, 2, 2, 2, 2, 2, 2, 2];

class GameMatrix extends StatefulWidget {
  const GameMatrix({super.key});
  @override
  State<GameMatrix> createState() => _GameMatrixState();
}

class _GameMatrixState extends State<GameMatrix> {
  @override
  Widget build(BuildContext context) {
      return Matrix();
  }
}

int? winLogic(List v) {
  int? win;
  for (List i in [
    [0, 1, 2],
    [0, 3, 6],
    [0, 4, 8],
    [3, 4, 5],
    [6, 7, 8],
    [2, 4, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]) {
    if (v[i[0]] == v[i[1]] && v[i[1]] == v[i[2]] && v[i[0]] != 2) {
      win = v[i[0]];
      break;
    }
  }
  return win;
}

class Matrix extends StatefulWidget {
  Matrix({super.key});
  int turn = 0;
  @override
  State<Matrix> createState() => _MatrixState();
}

class _MatrixState extends State<Matrix> {
  int turn = 0;
  @override
  Widget build(BuildContext context) {
    double boardwidth = MediaQuery.of(context).size.width;
    int? check = winLogic(values);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            width: boardwidth,
            height: boardwidth,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 57, 91, 100),
                borderRadius: BorderRadius.circular(16)),
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(9, (index) {
                return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 165, 201, 202),
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: IconButton(
                      iconSize: 100,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: values[index] == 2
                          ? const Icon(Icons.minimize)
                          : values[index] == 0
                              ? const Icon(Icons.circle_outlined)
                              : const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          if (check == 1 || check == 0) {
                          } 
                          else if (values[index] == 2) {
                            values[index] = turn;
                            if (turn == 1) {
                              turn = 0;
                            } else {
                              turn = 1;
                            }
                          }
                        });
                      },
                    ),
                  ),
                );
              }),
            )),
        Text(
          ((check == 1 || check == 0)
              ? "Player ${check == 0 ? 1 : 2} WON!!"
              : (turn == 0 ? "Player 1's turn(O)" : "Player 2's turn(X)")),
          style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              values = [2, 2, 2, 2, 2, 2, 2, 2, 2];
              turn = 0;
            });
          },
          child: const Icon(Icons.replay),
        ),
      ],
    );
  }
}
