import 'package:imitate_developer_quest/src/shared_state/game/skill.dart';
import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';

class Npc extends Aspect{
  final String name;
  final Map<Skill, double> prowess;

  final bool isHired = true;

  bool _isBusy = false;

  Npc(this.name,this.prowess);

  bool get isBusy =>_isBusy;

  set isBusy(bool value){
    _isBusy = value;
    markDirty();
  }

  @override
  String toString()=>name;
}