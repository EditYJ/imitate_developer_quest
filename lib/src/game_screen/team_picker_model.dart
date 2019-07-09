import 'package:flutter/material.dart';
import 'package:imitate_developer_quest/src/shared_state/game/npc.dart';
import 'package:imitate_developer_quest/src/shared_state/game/npc_pool.dart';
import 'package:imitate_developer_quest/src/shared_state/game/task.dart';
import 'package:imitate_developer_quest/src/shared_state/provider.dart';

class TeamPickerModal extends StatefulWidget {
  final Task task;

  TeamPickerModal(this.task);

  @override
  _TeamPickerModalState createState() {
    return _TeamPickerModalState(task.assignedTeam);
  }
}

class _TeamPickerModalState extends State<TeamPickerModal> {
  Set<Npc> _selected = Set<Npc>();

  _TeamPickerModalState(Iterable<Npc> initialTeam)
      : _selected = Set<Npc>.from(initialTeam ?? []);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text('Pick team for "${widget.task.blueprint.name}"'),
          Expanded(
            child: Provide<NpcPool>(
              builder: (context, child, npcPool) {
                return DataTable(
                  columns: [
                    DataColumn(label: Text('Name')),
                  ],
                  rows: npcPool
                      .where((npc) =>
                          npc.isHired &&
                          (!npc.isBusy || _selected.contains(npc)))
                      .map((npc) => DataRow(
                          selected: _selected.contains(npc),
                          onSelectChanged: (selected) => setState(() {
                                if (selected) {
                                  _selected.add(npc);
                                } else {
                                  _selected.remove(npc);
                                }
                              }),
                          cells: [DataCell(Text(npc.name))]))
                      .toList(growable: false),
                );
              },
            ),
          ),
          Container(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context, _selected),
                  child: Text('OK'),
                ),
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
