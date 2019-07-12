import 'package:imitate_developer_quest/src/shared_state/game/project_blueprint.dart';
import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';
import 'package:imitate_developer_quest/src/shared_state/game/task.dart';

enum ProjectState{Started,Failed,Complete}

class Project extends Aspect{
  final ProjectBlueprint blueprint;

  List<Task> tasks;

  double tickRemaining;
  double totalTicks;
  int bonusXp = 0;

  Project(this.blueprint){
    tasks = blueprint.taskBlueprints.map((taskBlueprint)=>Task(this, taskBlueprint)).toList();
  }

}