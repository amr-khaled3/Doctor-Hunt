import 'package:doctor_hunt/core/router/route_gen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DoctorHunt());
}

class DoctorHunt extends StatelessWidget {
  const DoctorHunt({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGen.onChaneRoute,
    );
  }
}

