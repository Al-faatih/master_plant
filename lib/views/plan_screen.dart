import 'package:flutter/material.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  Plan({this.name = '', this.tasks = const []});
}

class Task {
  final String description;
  final bool complete;

  Task({this.description = '', this.complete = false});
}

class PlanScreen extends StatefulWidget { 
  const PlanScreen({super.key}); 
 
  @override 
  State createState() => _PlanScreenState(); 
} 
 
class _PlanScreenState extends State<PlanScreen> { 
  Plan plan = Plan(); 
  late ScrollController scrollController; 

  @override 
  void initState() { 
    super.initState(); 
    scrollController = ScrollController()
      ..addListener(() { 
        FocusScope.of(context).requestFocus(FocusNode()); 
      }); 
  }

  @override 
  void dispose() { 
    scrollController.dispose(); 
    super.dispose(); 
  }

  Widget _buildAddTaskButton() { 
    return FloatingActionButton( 
      child: const Icon(Icons.add),
      onPressed: () { 
        setState(() { 
          plan = Plan( 
            name: plan.name, 
            tasks: List<Task>.from(plan.tasks)..add(Task()), 
          ); 
        }); 
      }, 
    ); 
  }  

  Widget _buildList() { 
    return ListView.builder( 
      controller: scrollController,
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
      itemCount: plan.tasks.length, 
      itemBuilder: (context, index) => 
        _buildTaskTile(plan.tasks[index], index), 
    ); 
  }

  Widget _buildTaskTile(Task task, int index) { 
    return ListTile( 
      leading: Checkbox( 
        value: task.complete, 
        onChanged: (selected) { 
          setState(() { 
            plan = Plan( 
              name: plan.name, 
              tasks: List<Task>.from(plan.tasks) 
                ..[index] = Task( 
                  description: task.description, 
                  complete: selected ?? false, 
                ), 
            ); 
          });
        }, 
      ), 
      title: TextFormField( 
        initialValue: task.description, 
        onChanged: (text) { 
          setState(() { 
            plan = Plan( 
              name: plan.name, 
              tasks: List<Task>.from(plan.tasks) 
                ..[index] = Task( 
                  description: text, 
                  complete: task.complete, 
                ), 
            ); 
          }); 
        }, 
      ), 
    ); 
  }  

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text('Master Plan Andrian Roby Maulana Alfaatih')), 
      body: _buildList(), 
      floatingActionButton: _buildAddTaskButton(), 
    ); 
  }
}
