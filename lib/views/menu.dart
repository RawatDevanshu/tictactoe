import 'package:flutter/material.dart';
import 'package:tictactoe/routes/routes.dart' as route;

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 44, 51, 51),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: (() {
                      Navigator.pushNamed((context), route.offline1v1);
                    }),
                    child: const Text(
                      "1v1",
                      textScaleFactor: 5,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(children: const <Widget>[
                    OnlineSwitch(),
                    Text(
                      "Online Mode",
                    ),
                  ]),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: (() {
                    Navigator.pushNamed((context), route.comp);
                  }),
                  child: const Text(
                    "V/S COMP",
                    textScaleFactor: 5,
                  )),
            ],
          ),
        ));
  }
}

class OnlineSwitch extends StatefulWidget {
  const OnlineSwitch({super.key});

  @override
  State<OnlineSwitch> createState() => _OnlineSwitchState();
}

class _OnlineSwitchState extends State<OnlineSwitch> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      activeColor: const Color.fromARGB(255, 231, 246, 242),
      value: value,
      onChanged: ((value) {
        setState(() {
          this.value = value;
        });
      }),
    );
  }
}
