import 'dart:collection';
import 'dart:math';

import 'package:imitate_developer_quest/src/shared_state/game/npc.dart';
import 'package:imitate_developer_quest/src/shared_state/game/project.dart';
import 'package:imitate_developer_quest/src/shared_state/game/skill.dart';
import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';
import 'package:imitate_developer_quest/src/shared_state/game/task_blueprint.dart';

final _random = Random();
/// 障碍问题状态{无，展示，已解决，未解决}
enum BlockingIssueState { none, shown, resolved, unresolved }

/// 给玩家或者队伍完成的一个单独任务
///
/// 定义任务的是蓝图[blueprint]。该类使用[percentComplete]保存任务进度
class Task extends Aspect{
  final TaskBlueprint blueprint;

  final Project project;
  final Map<Skill, double> completion = {};
  double boost = 1.0;

  List<Npc> _assignedTeam;

  Task(this.project,this.blueprint);

  // [UnmodifiableListView]或[UnmodifiableMapView]返回一个不可修改的List或Map
  UnmodifiableListView<Npc> get assignedTeam => _assignedTeam == null?null:UnmodifiableListView(_assignedTeam);

  /// 得到此任务的进度
  double get percentComplete{
    double required = 0.0;
    double completed = 0.0;
    // 累计所需技能和每项技能的完成量
    blueprint.difficlty.forEach((Skill skill, double amount){
      required+=amount;
      completed+=min(amount, completion[skill]??0.0);
    });
    return completed/required;
  }


  void assignTeam(Iterable<Npc> team){
    if(project.state != ProjectState.Started){
      return;
    }
    _assignedTeam = team.toList(growable: false);
    _assignedTeam.forEach((npc)=>npc.isBusy = true);
    markDirty();
  }

  /// 解除队伍中npc的忙碌状态
  void freeTeam(){
    if(_assignedTeam == null){
      return;
    }
    _assignedTeam.forEach((npc)=>npc.isBusy = false);
    _assignedTeam = null;
  }

  void update(){
    if(_assignedTeam!=null){
      for(Npc npc in _assignedTeam){
        npc.prowess.forEach((Skill skill, double amount){
          completion[skill] = (completion[skill]??0.0)+amount*boost;
        });
      }
      boost = 1.0;
      if(percentComplete >= 1.0 || project.state != ProjectState.Started){
        // 如果工作人员都做完了 就解放他们
        freeTeam();
      }
      markDirty();
    }
    super.update();
  }
}
