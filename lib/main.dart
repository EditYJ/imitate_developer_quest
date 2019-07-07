import 'package:flutter/material.dart';
import 'package:imitate_developer_quest/src/gameloop_screen.dart';

import 'package:imitate_developer_quest/src/shared_state/provider.dart';
import 'package:imitate_developer_quest/src/shared_state/game/world.dart';
import 'package:imitate_developer_quest/src/shared_state/user.dart';
import 'package:imitate_developer_quest/src/welcome_screen.dart';

void main() {
  var providers = Providers();
  providers.provideValue(User());

  var world = World();
  providers.provideValue(world);

  // Provider specific parts of the world separetely that
  // only care about quests, for example, can only listen to those
  providers.provideValue(world.taskPool);
  providers.provideValue(world.teamPool);
  providers.provideValue(world.countdown);

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dev_rpg',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      routes: {
        "/":(context)=>WelcomeScreen(),
        "/gameloop": (context)=>GameloopScreen(),
      },
    );
  }
}
