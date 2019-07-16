import 'package:flutter/material.dart';
import 'package:imitate_developer_quest/src/game_screen/npc_pool_page.dart';
import 'package:imitate_developer_quest/src/game_screen/stats_page.dart';
import 'package:imitate_developer_quest/src/game_screen/project_page.dart';
import 'package:imitate_developer_quest/src/shared_state/game/countdown_clock.dart';
import 'package:imitate_developer_quest/src/shared_state/provider.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  int _index = 0;
  final _controller = PageController();

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.page.round() != _index) {
        setState(() {
          _index = _controller.page.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Provide<CountdownClock>(
          builder: (context, child, countdown) =>
              Text("${countdown.remainingTime.inSeconds}s"),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) => setState(() {
              _index = index;
              _controller.jumpToPage(index);
            }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Team'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            title: Text('Tasks'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            title: Text('Stats'),
          ),
        ],
      ),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          NpcPoolPage(),
          TaskPoolPage(),
          StatsPage()
        ],
      ),
    );
  }
}
