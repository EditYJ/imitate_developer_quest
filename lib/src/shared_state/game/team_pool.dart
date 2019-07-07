import 'package:flutter/foundation.dart';
import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';
import 'package:imitate_developer_quest/src/shared_state/game/team.dart';

class TeamPool extends Aspect{
  final List<Team> _list = [
    Team('Flutter DevRel Team'),
  ];

  /// Right now we only have one team
  /// List.single属性检查列表是否只有一个元素并返回它。
  /// 如果列表有多个元素，那么将抛出异常
  /// @deprecated表示不建议使用
  @deprecated
  Team get single =>_list.single;

  void update(){
    for(var team in _list){
      team.update();
    }

    // the teams list currently doesn't get changed, ever. So we don't call
    // notifyListeners here
    super.update();
  }
}