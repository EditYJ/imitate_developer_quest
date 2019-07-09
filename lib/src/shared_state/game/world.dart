import 'dart:async';

import 'package:imitate_developer_quest/src/shared_state/game/countdown_clock.dart';
import 'package:imitate_developer_quest/src/shared_state/game/npc_pool.dart';
import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';
import 'package:imitate_developer_quest/src/shared_state/game/task_pool.dart';

/// The state of the world.
///
/// Widgets should subscribe to aspects of the world (such as [taskPool])
/// instead of this whole world, unless they really care about every change.
class World extends Aspect {
  static final tickDuration = const Duration(milliseconds: 200);

  Timer _timer;

  final TaskPool taskPool;
  final NpcPool npcPool;
  final CountdownClock countdown;

  bool _isRunning = false;

  World()
      : taskPool = TaskPool(),
        npcPool = NpcPool(),
        countdown = CountdownClock();

  /// 当模拟正常运行的时候返回`true`
  bool get isRunning =>_isRunning;

  void pause() {
    _timer.cancel();
    _isRunning = false;
    markDirty();
  }

  void start() {
    _timer = Timer.periodic(tickDuration, _performTick);
    _isRunning = true;
    markDirty();
  }

  void update() {
    taskPool.update();
    npcPool.update();
    countdown.update();
    super.update();
  }

  void _performTick(Timer timer){
    update();
  }
}
