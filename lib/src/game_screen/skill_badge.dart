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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
