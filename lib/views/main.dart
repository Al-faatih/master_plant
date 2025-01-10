import 'package:flutter/material.dart';
import 'package:master_plant/models/plan.dart'; 
import 'package:master_plant/plan_provider.dart';
import 'package:master_plant/views/plan_screen.dart'; 


void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PlanProvider(
        notifier: ValueNotifier,
        child: const PlanScreen(),
      ),
    );
  }
}
