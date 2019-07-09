import 'dart:collection';

import 'package:imitate_developer_quest/src/shared_state/game/npc.dart';
import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';

/// [Npc]列表
class NpcPool extends Aspect with ListMixin<Npc>{
  static const _seedNames = [
    "马云",
    "马化腾",
    "张壮",
    "李鹏浩",
    "胡志辉"
  ];

  final List<Npc> list;

  NpcPool(): list = _seedNames.map((name)=>Npc.sample(name)).toList();

  @override
  int get length =>list.length;

  @override
  set length(int newLength){
    list.length = newLength;
    markDirty();
  }

  @override
  Npc operator [](int index) {
    return list[index];
  }

  @override
  void operator []=(int index, Npc value) {
    list[index] = value;
    markDirty();
  }

  void update(){
    for(final npc in this){
      if(npc.isDirty) markDirty();
      npc.update();
    }
    super.update();
  }
  
}