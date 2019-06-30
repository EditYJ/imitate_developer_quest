import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'package:imitate_developer_quest/src/shared_state/game/quest.dart';

/// A container of [Quest]s. There is only one of this per world.
///
/// This is better that 'List<Quest>' because we can attach behavior
/// to this (like[updateAll]) and only update the widgets once
class Quests extends ChangeNotifier with ListMixin<Quest> {
  static const _seedQuestNames = [
    "Refactor state management", //重构状态管理
    "Add animations", //添加动画
    "Find bug #34412",
    "Shorten build time", //缩短构建时间
    "Add CI",
    "Deploy to TestFlight", //部署到测试
  ];

  final List<Quest> list;

  ///构造函数初始化列表
  Quests() : list = _seedQuestNames.map((name) => Quest(name)).toList();

  @override
  int get length => list.length;

  @override
  set length(int newLength) => list.length = newLength;

  // 重载符号[] 取值
  @override
  Quest operator [](int index) => list[index];

  // 重载符号[]= 设置值
  @override
  void operator []=(int index, Quest value) => list[index] = value;

  void updateAll() {
    for (final quest in this) {
      quest.update();
    }
    notifyListeners();
  }
}
