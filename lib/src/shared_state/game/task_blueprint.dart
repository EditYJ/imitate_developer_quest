import 'package:imitate_developer_quest/src/shared_state/game/blocking_issue.dart';
import 'package:meta/meta.dart';

/// 任务计划
///
/// This is immutable(不可变的)
@immutable
class TaskBlueprint{
  final String name;
  final int xpReward;
  final BlockingIssue blockingIssue;

  const TaskBlueprint(this.name,this.xpReward,this.blockingIssue);
}