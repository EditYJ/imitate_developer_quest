import 'package:flutter/material.dart';
import 'package:imitate_developer_quest/src/game_screen/skill_badge.dart';
import 'package:imitate_developer_quest/src/game_screen/team_picker_model.dart';
import 'package:imitate_developer_quest/src/shared_state/game/npc.dart';
import 'package:imitate_developer_quest/src/shared_state/game/skill.dart';
import 'package:imitate_developer_quest/src/shared_state/game/task.dart';
import 'package:imitate_developer_quest/src/shared_state/provider.dart';

class TaskListItem extends StatelessWidget {
  TaskListItem({Key key}) : super(key: key);

  void _onAssigned(Task task, Set<Npc> value) {
    if (value == null || value.isEmpty) return;
    task.assignTeam(value);
  }

  @override
  Widget build(BuildContext context) {
    return Provide<Task>(
        builder: (context, child, task) => Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Card(
                child: InkWell(
                  onTap: () => showModalBottomSheet<Set<Npc>>(
                        context: context,
                        builder: (context) => TeamPickerModal(task),
                      ).then((npcs) => _onAssigned(task, npcs)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Text(task.blueprint.name, style: TextStyle(fontSize: 14)),
                            Expanded(
                              child: Wrap(
                                alignment: WrapAlignment.end,
                                children: task.blueprint.requirements.map((Skill skill)=>SkillBadge(skill)).toList(),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: LinearProgressIndicator(value: task.percentComplete),
                      ),
                      task.assignedTeam == null?SizedBox():Container(
                        height: 100.0,
                          color: Colors.deepOrange,child: InkWell(
                        onTap: ()=>task.boost +=2.5,
                        child: Text("Team Pic Goes Here... assigned to: ${task.assignedTeam}.Tap to boost."),
                      ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
