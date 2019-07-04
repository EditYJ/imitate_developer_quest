import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';
import 'package:imitate_developer_quest/src/shared_state/game/world.dart';

class CountdownClock extends Aspect{
  Duration remainingTime = Duration(minutes: 10);

  void update(){
    remainingTime -= World.tickDuration;
    markDirty();
    super.update();
  }
}