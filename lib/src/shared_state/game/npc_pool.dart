import 'dart:collection';

import 'package:imitate_developer_quest/src/shared_state/game/npc.dart';
import 'package:imitate_developer_quest/src/shared_state/game/skill.dart';
import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';

/// [Npc]列表
class NpcPool extends Aspect with ListMixin<Npc> {
  final List<Npc> list;

  NpcPool()
      : list = [
          Npc("重构者", {Skill.Coding: 1}),
          Npc("架构师", {Skill.Coding: 3, Skill.ProjectManagement: 1}),
          Npc("年轻的设计师", {Skill.Design: 1}),
          Npc("冒失的产品经理", {Skill.Ux: 2}),
          Npc("年迈的画家", {Skill.Coding: 1}),
        ];

  @override
  int get length => list.length;

  @override
  set length(int newLength) {
    UnsupportedError("禁止设置npc池的长度！");
  }

  @override
  Npc operator [](int index) {
    return list[index];
  }

  @override
  void operator []=(int index, Npc value) {
    UnsupportedError("禁止改变人物！");
  }

  void update() {
    for (final npc in this) {
      if (npc.isDirty) markDirty();
      npc.update();
    }
    super.update();
  }
}
