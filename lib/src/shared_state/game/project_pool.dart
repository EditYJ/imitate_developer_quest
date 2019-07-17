import 'package:imitate_developer_quest/src/shared_state/game/project.dart';
import 'package:imitate_developer_quest/src/shared_state/game/project_blueprint.dart';
import 'package:imitate_developer_quest/src/shared_state/game/skill.dart';
import 'package:imitate_developer_quest/src/shared_state/game/src/aspect.dart';
import 'package:imitate_developer_quest/src/shared_state/game/task.dart';
import 'package:imitate_developer_quest/src/shared_state/game/task_blueprint.dart';

class ProjectPool extends Aspect {

  // 此系统中所有的项目
  static const List<ProjectBlueprint> availableProjects = const [
    ProjectBlueprint("Hello World!", 100, <TaskBlueprint>[
      TaskBlueprint("编译代码", {Skill.Coding: 120}),
      TaskBlueprint("添加打印语句", {Skill.Coding: 100}),
      TaskBlueprint("编写技巧博文", {Skill.Coding: 110}),
    ]),
    ProjectBlueprint("地址簿App", 210, <TaskBlueprint>[
      TaskBlueprint("设计产品原型", {Skill.Ux: 120}),
      TaskBlueprint("设计产品架构", {Skill.ProjectManagement: 120}),
      TaskBlueprint("编写代码", {Skill.Coding: 120}),
    ]),
    ProjectBlueprint("Weather App", 400, <TaskBlueprint>[
      TaskBlueprint("规划未来", {Skill.Ux: 110, Skill.ProjectManagement: 110}),
      TaskBlueprint("设计原型", {Skill.Ux: 110}),
      TaskBlueprint("设计天气动画", {Skill.Design: 130}),
      TaskBlueprint("设计程序状态", {Skill.Design: 110, Skill.ProjectManagement: 110}),
      TaskBlueprint("构建客户端模型", {Skill.Coding: 110}),
      TaskBlueprint("实现接口", {Skill.Coding: 130}),
      TaskBlueprint("提交至应用商店", {Skill.ProjectManagement: 110}),
    ])
  ];

  ProjectPool();

  final List<Project> chosenProjects =[];
  final List<Project> workingProjects =[];
  final List<Project> deadProjects =[];

  List<Aspect> get flatWorkingProjectsWithTasks{
    List<Aspect> flattened = [];
    chosenProjects.forEach((Project project){
      flattened.add(project);
      if(project.state == ProjectState.Started){
        project.tasks.forEach((Task task){
          flattened.add(task);
        });
      }
    });
    return flattened;
  }

  @override
  void update() {
    final List<Project> justCompleted = [];
    for (final project in workingProjects){
      project.update();
      if(project.state == ProjectState.Complete){
        project.bonusXp = (project.tickRemaining/10).round();
      }
      if(project.state != ProjectState.Started){
        justCompleted.add(project);
      }
    }

    if(justCompleted.isNotEmpty){
      for(final justCompletedProject in justCompleted){
        workingProjects.remove(justCompleted);
        deadProjects.add(justCompletedProject);
      }
      markDirty();
    }
    super.update();
  }

  void startProject(ProjectBlueprint projectBlueprint){
    Project project = Project(projectBlueprint);
    chosenProjects.add(project);
    workingProjects.add(project);
    markDirty();
  }
}
