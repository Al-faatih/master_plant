import 'package:flutter/material.dart';
import 'package:master_plant/plan_provider.dart'; // Mengimpor PlanProvider
import './task.dart'; // Mengimpor Task class jika diperlukan

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plan Andrian Roby Maulana Alfaatih')),
      body: ValueListenableBuilder<Plan>(
        valueListenable: PlanProvider.of(context), // Mendengarkan perubahan pada PlanProvider
        builder: (context, plan, child) {
          return _buildList(plan); // Menggunakan data plan yang didapat dari ValueListenableBuilder
        },
      ),
      floatingActionButton: Builder(
        builder: (context) {
          // Menambahkan BuildContext sebagai parameter dan menggunakan PlanProvider
          ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Plan currentPlan = planNotifier.value;
              planNotifier.value = Plan(
                name: currentPlan.name,
                tasks: List<Task>.from(currentPlan.tasks)..add(const Task()), // Menambahkan task baru
              );
            },
          );
        },
      ),
    );
  }

  // Membangun list tugas berdasarkan Plan
  Widget _buildList(Plan plan) {
    return ListView.builder(
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan, index),
    );
  }

  // Membangun tile untuk setiap task
  Widget _buildTaskTile(Plan plan, int index) {
    final task = plan.tasks[index];
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          // Mengubah status complete dari task
          final updatedTask = Task(
            description: task.description,
            complete: selected ?? false,
          );
          PlanProvider.of(context).value = Plan(
            name: plan.name,
            tasks: List<Task>.from(plan.tasks)..[index] = updatedTask,
          );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          // Mengubah deskripsi task
          final updatedTask = Task(
            description: text,
            complete: task.complete,
          );
          PlanProvider.of(context).value = Plan(
            name: plan.name,
            tasks: List<Task>.from(plan.tasks)..[index] = updatedTask,
          );
        },
      ),
    );
  }
}
