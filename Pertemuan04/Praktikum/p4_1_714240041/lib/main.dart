import 'package:flutter/material.dart';
import 'package:p4_1_714240041/detail_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Tempat WIsata Bandung',
    home: const DetailScreen(),);
  }
}