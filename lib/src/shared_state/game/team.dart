import 'dart:math';

import 'package:imitate_developer_quest/src/shared_state/game/quest.dart';
import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';
import 'package:imitate_developer_quest/src/shared_state/game/task.dart';

final _random = Random();

/// A ragtag bunch of misfits that do all the work.
class Team extends Aspect{
  /// The task that this team is currently working on, if any.
  Task _assignedTo;
  final String name;

  Team(this.name);

  /// The maximum number of percentage points done in a single game update.
  int get maxHit =>5;

  void assignTo(Task task){
    _assignedTo?.assignTeam(null);

    _assignedTo = task;
    task.assignTeam(this);
    markDirty();
  }

  @override
  String toString() =>name;

  void update(){
    if(_assignedTo == null) return;
    var progress;
    if(_assignedTo.isBlocked){
      progress = _random.nextInt(2);
    }else{
      progress = _random.nextInt(maxHit);
    }
    _assignedTo.makeProgress(progress);
    super.update();
  }
}