import 'package:imitate_developer_quest/src/shared_state/game/skill.dart';
import 'package:imitate_developer_quest/src/shared_state/game/task_blueprint.dart';
import 'package:meta/meta.dart';

/// 项目的蓝图
///
/// 这个类是不可变的，运行时的状态放入[Project].
@immutable
class ProjectBlueprint{
  final String name;
  final List<TaskBlueprint> taskBlueprints;
  final int xpReward;

  /// 最低技能要求
  ///
  /// 表示此项目需要的技能需求
  Set<Skill> get skills{
    Set<Skill> requirements = Set<Skill>();
    for(final TaskBlueprint task in taskBlueprints){
      task.difficlty.forEach((Skill skill, double value){
        requirements.add(skill);
      });
    }
    return requirements;
  }

  ///完成任务的时间是基于任务的总难度。
  ///
  /// 他表示项目中所有任务的的总难度[totalDifficulty]
  ///
  /// fold: fold(initValue,(preValue,element)=>());
  /// 根据现有的List和给定的initValue,指定一个参数函数规则，对List每个元素做操作，并将结果返回。
  double get totalDifficulty{
    return taskBlueprints.fold<double>(0.0, (double value, TaskBlueprint task){
      task.difficlty.forEach((final Skill skill,double amount){
        value+=amount;
      });
      return value;
    });
  }

  const ProjectBlueprint(this.name,this.xpReward,this.taskBlueprints);
}