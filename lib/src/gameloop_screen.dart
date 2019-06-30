import 'package:flutter/material.dart';
import 'package:imitate_developer_quest/src/gameloop_screen/list_item.dart';
import 'package:imitate_developer_quest/src/shared_state/game/quests.dart';
import 'package:imitate_developer_quest/src/shared_state/provider.dart';

class GameloopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Provide<Quests>(
        builder: (context, child, quests){
          return ListView.builder(
            itemCount: quests.length,
            itemBuilder: (context, index)=>QuestListItem(
              quest: quests[index],
              key: ValueKey(quests[index]),
            ),
          );
        },
      )
    );

  }
}
