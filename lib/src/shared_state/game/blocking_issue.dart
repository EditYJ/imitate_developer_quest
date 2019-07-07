import 'package:meta/meta.dart';

/// 任务完成期间给玩家制造的一些拦截难题[BlockingIssue]
@immutable
class BlockingIssue {
  /// 限制时间
  final Duration duration;

  /// 当玩家试图解决问题[question]的时候给玩家抛出的问题
  final String question;

  /// 在特定的任务完成百分比[startAtProcessLevel]的地方给予玩家缺陷的问题
  final int startAtProcessLevel;

  /// 构造函数
  const BlockingIssue(this.duration, this.question, this.startAtProcessLevel);

  @Deprecated('建立样本,参考使用')
  BlockingIssue.sample()
      : this(Duration(seconds: 6), "Lormem ipsum question to be answer?", 25);
}
