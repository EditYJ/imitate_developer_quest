import 'package:flutter/material.dart';
import 'package:imitate_developer_quest/src/shared_state/game/quest.dart';

class QuestListItem extends StatelessWidget {
  final Quest quest;

  QuestListItem({Key key, @required this.quest})
      : assert(quest != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Text(quest.name, style: Theme.of(context).textTheme.title,),
          LinearProgressIndicator(value: quest.percentComplete,)
        ],
      ),
    );
  }
}
