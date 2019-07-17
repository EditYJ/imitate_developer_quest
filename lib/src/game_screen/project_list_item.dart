import 'package:flutter/material.dart';
import 'package:imitate_developer_quest/src/shared_state/game/project.dart';
import 'package:imitate_developer_quest/src/shared_state/provider.dart';

class ProjectListItem extends StatelessWidget {
  ProjectListItem({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provide<Project>(
      builder: (context, child, project) => Card(
            margin: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () => print("Show issues"),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          project.blueprint.name,
                          style: TextStyle(fontSize: 16),
                        ),
                        Expanded(
                          child: project.state == ProjectState.Failed
                              ? Text(
                                  "FAILED",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red),
                                )
                              : SizedBox(),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Icon(
                              project.percentTimeLeft < 0.3333 &&
                                      project.percentComplete < 1.0
                                  ? Icons.mood_bad
                                  : Icons.mood,
                              size: 32,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 70.0,
                                      child: Text("TIME LEFT:",
                                          style: TextStyle(fontSize: 11)),
                                    ),
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value: project.percentTimeLeft,
                                      ),
                                    )
                                  ],
                                ),
                                Container(height: 5),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 70.0,
                                      child: Text("PROGRESS:",
                                          style: TextStyle(fontSize: 11)),
                                    ),
                                    Expanded(
                                        child: LinearProgressIndicator(
                                      value: project.percentComplete,
                                    )),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
