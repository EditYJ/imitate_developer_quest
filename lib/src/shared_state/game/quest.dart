import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';
import 'package:imitate_developer_quest/src/shared_state/game/team.dart';

/// A single task for the player and her team to complete
class Quest extends Aspect{
  final String name;
  int _percentComplete = 0;

  /// The quest has changed since the last time [update] was called
  bool _isDirty = false;

  Team _assignedTeam;

  Quest(this.name);

  Team get assignedTeam => _assignedTeam;
  double get percentComplete => _percentComplete / 100;

  void makeProgress(int percent) {
    assert(percent >= 0);
    if (percent == 0) return;
    if (_percentComplete == 100) return;
    _percentComplete += percent;
    if (_percentComplete > 100) _percentComplete = 100;
    markDirty();
  }

  /// 为任务分配队伍
  void assignTeam(Team team) {
    _assignedTeam = team;
    markDirty();
  }
}
