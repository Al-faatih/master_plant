import 'package:flutter/material.dart'; 
import 'plan_screen.dart'; 
 
void main() => runApp(MasterPlanApp()); 
 
class MasterPlanApp extends StatelessWidget { 
  const MasterPlanApp({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
 return MaterialApp( 
     theme: ThemeData(primarySwatch: Colors.green), 
     home: PlanScreen(), 
    ); 
  } 
} 