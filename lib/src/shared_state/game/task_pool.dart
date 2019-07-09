import 'dart:collection';

import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';
import 'package:imitate_developer_quest/src/shared_state/game/task.dart';

class TaskPool extends Aspect with ListMixin<Task>{
  static const _seedQuestNames = [
    "重构状态管理",
    "添加动画",
    "添加指南",
    "寻找#34412BUG",
    "缩短构建时间",
    "添加客户端",
    "部署到测试服务",
  ];

  final List<Task> list;

  TaskPool():list = _seedQuestNames.map((name)=>Task.sample(name)).toList();

  @override
  int get length => list.length;

  @override
  set length(int newLength){
    list.length = newLength;
    markDirty();
  }

  @override
  Task operator [](int index) => list[index];

  @override
  void operator []=(int index, Task value) {
    list[index] = value;
    markDirty();
  }

  void update(){
    for(final task in this){
      task.update();
//      if(task.isDirty) markDirty();
    }
    super.update();
  }
}