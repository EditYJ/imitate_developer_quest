import 'package:imitate_developer_quest/src/shared_state/game/project_blueprint.dart';
import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';
import 'package:imitate_developer_quest/src/shared_state/game/task.dart';

enum ProjectState { Started, Failed, Complete }

class Project extends Aspect {
  final ProjectBlueprint blueprint;

  List<Task> tasks;

  double tickRemaining;
  double totalTicks;
  int bonusXp = 0;

  Project(this.blueprint) {
    tasks = blueprint.taskBlueprints
        .map((taskBlueprint) => Task(this, taskBlueprint))
        .toList();

    tickRemaining = totalTicks = blueprint.totalDifficulty;
  }

  bool get isComplete =>
      tasks.firstWhere((task) => task.percentComplete < 1.0,
          orElse: () => null) ==
      null;
  double get percentComplete =>
      tasks.fold<double>(
          0.0, (double value, Task task) => value + task.percentComplete) /
      tasks.length;

  double get percentTimeLeft => tickRemaining/totalTicks;

  ProjectState get state => isComplete
      ? ProjectState.Complete
      : percentTimeLeft >0.0?ProjectState.Started: ProjectState.Failed;

  @override
  void update() {
    super.update();

    // 项目开始了吗？
    if(tickRemaining != null && tickRemaining>0){
      tickRemaining--;
      for(Task task in tasks){
        task.update();
      }
      markDirty();
    }
  }
}
