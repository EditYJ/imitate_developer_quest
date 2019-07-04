import 'package:flutter/foundation.dart';
import 'package:imitate_developer_quest/src/shared_state/game/world.dart';

class CountdownClock extends ChangeNotifier{
  Duration remainingTime = Duration(minutes: 10);

  void update(){
    remainingTime -= World.tickDuration;
    notifyListeners();
  }
}