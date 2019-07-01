import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:imitate_developer_quest/src/shared_state/game/quest.dart';

final _random = Random();

/// A ragtag bunch of misfits that do all the work.
class Team extends ChangeNotifier{
  /// The task that this team is currently working on, if any.
  Quest _assignedTo;
  final String name;
  bool _isDirty = false;

  Team(this.name);

  /// The maximum number of percentage points done in a single game update.
  int get maxHit =>5;

  void assignTo(Quest quest){
    _assignedTo?.assignTeam(null);

    _assignedTo = quest;
    quest.assignTeam(this);
    _isDirty = true;
  }

  @override
  String toString() =>name;

  void update(){
    if(_isDirty){
      notifyListeners();
      _isDirty = false;
    }
    if(_assignedTo == null) return;

    var progress = _random.nextInt(maxHit);
    _assignedTo.makeProgress(progress);
  }
}