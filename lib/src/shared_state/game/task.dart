import 'package:imitate_developer_quest/src/shared_state/game/blocking_issue.dart';
import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';
import 'package:imitate_developer_quest/src/shared_state/game/task_blueprint.dart';
import 'package:imitate_developer_quest/src/shared_state/game/team.dart';

/// 障碍问题状态{无，展示，已解决，未解决}
enum BlockingIssueState { none, shown, resolved, unresolved }

class Task extends Aspect{
  final TaskBlueprint blueprint;

  int _percentComplete = 0;

  DateTime _blockingIssueStartTime;

  BlockingIssueState _blockingIssueState = BlockingIssueState.none;

  Team _assignedTeam;

  Task(this.blueprint){
    UnimplementedError();
  }

  Task.sample(String name):
      blueprint = TaskBlueprint(name, 100, BlockingIssue.sample());

  Team get assignedTeam=>_assignedTeam;

  bool get isBlocked => _blockingIssueState == BlockingIssueState.shown;

  double get percentComplete => _percentComplete /100;

  void assignTeam(Team team){
    _assignedTeam = team;
    markDirty();
  }

  void makeProgress(int percent){
    assert(percent >= 0);
    if(percent == 0) return;
    if(_percentComplete == 100)return;
    _percentComplete +=percent;
    if(_blockingIssueStartTime == null && _percentComplete > blueprint.blockingIssue.startAtProcessLevel){
      _blockingIssueState = BlockingIssueState.shown;
      _blockingIssueStartTime =DateTime.now().toUtc();
    }
    if(_percentComplete > 100){
      _percentComplete = 100;
      if(_blockingIssueState != BlockingIssueState.resolved){
        _blockingIssueState = BlockingIssueState.resolved;
      }
    }
    markDirty();
  }

  void update(){
    if(_blockingIssueState == BlockingIssueState.shown){
      var blockingIssueEnd = _blockingIssueStartTime.add(blueprint.blockingIssue.duration);
      if(blockingIssueEnd.isBefore(DateTime.now())){
        _blockingIssueState = BlockingIssueState.unresolved;
        markDirty();
      }
    }
    super.update();
  }

  /// Resolves the blocking issue.
  void resolveIssue(){
    assert(_blockingIssueState == BlockingIssueState.shown);
    _blockingIssueState = BlockingIssueState.resolved;
    markDirty();
  }
}
