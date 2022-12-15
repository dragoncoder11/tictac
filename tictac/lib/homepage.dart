import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int n1 = 0;
  int n2 = 0;
  var x = 0;
  bool ist = true;
  var s = TextStyle(color: Colors.white, fontSize: 30);
  var l = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'winnew X',
                        style: s,
                      ),
                      Text(
                        '$n1',
                        style: s,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        'winnew O',
                        style: s,
                      ),
                      Text(
                        '$n2',
                        style: s,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 80),
              Expanded(
                child: GridView.builder(
                    itemCount: l.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Center(
                            child: Text(
                              '${l[index]}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }

  tapped(int index) {
    setState(() {
      if (ist && l[index] == '') {
        l[index] = 'O';
        x += 1;
      } else if (!ist && l[index] == '') {
        l[index] = 'X';
        x += 1;
      }
      ist = !ist;
      check();
    });
  }

  check() {
    if (l[0] == l[1] && l[0] == l[2] && l[0] != '') {
      winner(l[0]);
    } else if (l[0] == l[3] && l[0] == l[6] && l[0] != '') {
      winner(l[0]);
    } else if (l[0] == l[4] && l[0] == l[8] && l[0] != '') {
      winner(l[0]);
    } else if (l[1] == l[4] && l[1] == l[7] && l[1] != '') {
      winner(l[1]);
    } else if (l[2] == l[5] && l[2] == l[8] && l[2] != '') {
      winner(l[2]);
    } else if (l[2] == l[4] && l[2] == l[6] && l[2] != '') {
      winner(l[2]);
    } else if (l[3] == l[4] && l[3] == l[5] && l[3] != '') {
      winner(l[3]);
    } else if (l[6] == l[7] && l[6] == l[8] && l[6] != '') {
      winner(l[6]);
    } else if (x == 9) {
      again();
    }
  }

  again() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('again'),
            actions: [
              TextButton(
                  onPressed: () {
                    clear();
                    Navigator.pop(context);
                  },
                  child: Text('play again'))
            ],
          );
        });
  }

  winner(String w) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('winner is $w'),
            actions: [
              TextButton(
                  onPressed: () {
                    clear();
                    Navigator.pop(context);
                  },
                  child: Text('play again'))
            ],
          );
        });
    if (w == 'O') {
      n1 += 1;
    }
    if (w == 'X') {
      n2 += 1;
    }
  }

  clear() {
    setState(() {
      for (int i = 0; i < l.length; i++) {
        l[i] = '';
      }
    });
    x = 0;
  }
}
