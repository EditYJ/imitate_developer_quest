import 'package:imitate_developer_quest/src/shared_state/game/blocking_issue.dart';
import 'package:meta/meta.dart';

/// 任务计划
///
/// 这个类是不可变的[immutable],在任务[Task]中添加运行时状态
@immutable
class TaskBlueprint{
  final String name;
  final int xpReward;
  final BlockingIssue blockingIssue;

  const TaskBlueprint(this.name,this.xpReward,this.blockingIssue);
}