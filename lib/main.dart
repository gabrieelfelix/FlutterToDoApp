import 'package:flutter/material.dart';
import 'package:to_do_app/screens/homepage/home_page.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/data_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ToDoData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
