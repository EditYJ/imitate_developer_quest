import 'package:imitate_developer_quest/src/shared_state/game/skill.dart';
import 'package:meta/meta.dart';

/// 任务计划
///
/// 这个类是不可变的[immutable],在任务[Task]中添加运行时状态
@immutable
class TaskBlueprint{
  final String name;
  final Map<Skill, double> difficlty;

  List<Skill> get requirements{
    List<Skill> skills = [];
    difficlty.forEach((Skill skill, double amount){
      skills.add(skill);
    });
    return skills;
  }

  const TaskBlueprint(this.name,this.difficlty);
}