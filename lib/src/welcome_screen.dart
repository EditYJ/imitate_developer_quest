import 'package:flutter/material.dart';
import 'package:imitate_developer_quest/src/shared_state/game/world.dart';
import 'package:imitate_developer_quest/src/shared_state/provider.dart';
import 'package:imitate_developer_quest/src/shared_state/user.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Provide<User>(
              builder: (context, child, value)=>Text("Welcome, $value!"),
            ),
            FlatButton(
              onPressed: (){
                Provide.value<World>(context).start();
                return Navigator.of(context).pushNamed('/gameloop');
              },
              color: Colors.orangeAccent,
              child: Text("Start"),
            )
          ],
        ),
      ),
    );
  }
}
