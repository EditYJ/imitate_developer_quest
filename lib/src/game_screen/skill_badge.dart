import 'package:flutter/material.dart';
import 'package:imitate_developer_quest/src/shared_state/game/skill.dart';

Map<Skill, String> skillDisplayName = {
  Skill.Coding: "Code",
  Skill.Design: 'Design',
  Skill.Ux: "UX",
  Skill.ProjectManagement: "Progect Management"
};

Map<Skill, Color> skillColor = {
  Skill.Coding: Colors.blueGrey,
  Skill.Design: Colors.deepPurple,
  Skill.Ux: Colors.deepOrange,
  Skill.ProjectManagement: Colors.lightGreen
};

class SkillBadge extends StatelessWidget {
  final Skill skill;
  final double value;

  SkillBadge(this.skill, [this.value]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: skillColor[skill],
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Text(
          skillDisplayName[skill] + (value != null ? "(${value.round()})" : ""),
          style: TextStyle(fontSize: 10.0, color: Colors.white),
        ),
      ),
    );
  }
}
