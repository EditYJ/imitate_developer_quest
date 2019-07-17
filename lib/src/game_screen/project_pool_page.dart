import 'package:flutter/material.dart';
import 'package:imitate_developer_quest/src/game_screen/project_list_item.dart';
import 'package:imitate_developer_quest/src/game_screen/project_picker_modal.dart';
import 'package:imitate_developer_quest/src/game_screen/task_list_item.dart';
import 'package:imitate_developer_quest/src/shared_state/game/project.dart';
import 'package:imitate_developer_quest/src/shared_state/game/project_blueprint.dart';
import 'package:imitate_developer_quest/src/shared_state/game/project_pool.dart';
import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';
import 'package:imitate_developer_quest/src/shared_state/game/task.dart';
import 'package:imitate_developer_quest/src/shared_state/provider.dart';

class ProjectPoolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<ProjectPool>(
      builder: (context, child, projectPool) {
        List<Aspect> projectAndTasks = projectPool.flatWorkingProjectsWithTasks;
        return new Stack(
          children: <Widget>[
            Positioned.fill(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 110),
                itemCount: projectAndTasks.length,
                itemBuilder: (context, index) {
                  Aspect item = projectAndTasks[index];
                  if (item is Project) {
                    return ProviderNode(
                      providers: Providers.withProviders({
                        Project: Provider<Project>.value(item),
                      }),
                      child: ProjectListItem(
                        key: ValueKey(item),
                      ),
                    );
                  } else if (item is Task) {
                    return ProviderNode(
                      providers: Providers.withProviders({
                        Task: Provider<Task>.value(item),
                      }),
                      child: TaskListItem(),
                    );
                  }
                },
              ),
            ),
            new Positioned.fill(
              right: 20.0,
              top: 50.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    elevation: 0.0,
                    child: new Icon(Icons.add),
                    onPressed: () => showModalBottomSheet<ProjectBlueprint>(
                          context: context,
                          builder: (context) =>
                              ProjectPickerModal(ProjectPool.availableProjects),
                        ).then((ProjectBlueprint project) => project != null
                            ? projectPool.startProject(project)
                            : null),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
