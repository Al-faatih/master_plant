import 'package:flutter/material.dart';


class Plan {
  final String name;
  final List<Task> tasks;

  Plan({this.name = '', this.tasks = const []});
}

class Task {
  const Task();
}

class PlanScreen extends StatefulWidget { 
  const PlanScreen({super.key}); 
 
  @override 
  State createState() => _PlanScreenState(); 
} 
 
class _PlanScreenState extends State<PlanScreen> { 
  Plan plan = Plan(); 
 
  Widget _buildAddTaskButton() { 
    return FloatingActionButton( 
      child: const Icon(Icons.add),
      onPressed: () { 
        setState(() { 
          plan = Plan( 
            name: plan.name, 
            tasks: List<Task>.from(plan.tasks)..add(const Task()), 
          ); 
        }); 
      }, 
    ); 
  }  

  Widget _buildList() { 
    return ListView.builder( 
      itemCount: plan.tasks.length, 
      itemBuilder: (context, index) => 
        _buildTaskTile(plan.tasks[index], index), 
    ); 
  }

  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      title: Text('Task ${index + 1}'), 
    );
  }

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text('Andrian Roby Maulana Alfaatih')), 
      body: _buildList(), 
      floatingActionButton: _buildAddTaskButton(), 
    ); 
  } 
}
