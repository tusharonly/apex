import 'package:apex/src/modules/root.dart';
import 'package:apex/src/theme.dart';
import 'package:flutter/material.dart';

class ApexApp extends StatelessWidget {
  const ApexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apex',
      theme: AppTheme.dark,
      darkTheme: AppTheme.dark,
      home: RootPage(),
    );
  }
}
