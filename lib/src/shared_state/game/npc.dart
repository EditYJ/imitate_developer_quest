import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';

class Npc extends Aspect{
  final String name;

  final bool isHired = true;

  bool _isBusy = false;

  @Deprecated('快速创建Npc的快捷方式')
  Npc.sample(this.name);

  bool get isBusy =>_isBusy;

  set isBusy(bool value){
    _isBusy = value;
    markDirty();
  }

  @override
  String toString()=>name;
}