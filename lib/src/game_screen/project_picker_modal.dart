import 'package:flutter/material.dart';
import 'package:imitate_developer_quest/src/game_screen/skill_badge.dart';
import 'package:imitate_developer_quest/src/shared_state/game/project_blueprint.dart';
import 'package:imitate_developer_quest/src/shared_state/game/skill.dart';

class ProjectPickerModal extends StatelessWidget {
  final List<ProjectBlueprint> _projects;

  const ProjectPickerModal(this._projects, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _projects.length + 1,
      itemBuilder: (context, index) {
        ProjectBlueprint blueprint = index == 0 ? null : _projects[index - 1];
        return index == 0
            ? Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child:
                    Text("AVAILABLE PROJECTS", style: TextStyle(fontSize: 11)),
              )
            : Padding(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  margin: const EdgeInsets.all(0.0),
                  child: InkWell(
                    onTap: () => Navigator.pop(context, blueprint),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(blueprint.name, style: TextStyle(fontSize: 16)),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 5.0),
                            child: Text("COMPLETION REWARD:",
                                style: TextStyle(fontSize: 11)),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.stars, size: 16),
                              Text(
                                blueprint.xpReward.toString(),
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 5.0),
                            child: Text("SKILLS REQUIRED",
                                style: TextStyle(fontSize: 11)),
                          ),
                          Wrap(
                            children: blueprint.skills
                                .map((Skill skill) => SkillBadge(skill))
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
