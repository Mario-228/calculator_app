import 'package:calculator/layout_screen.dart';
import 'package:flutter/material.dart';

void main() 
{
  return runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget 
{
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Layout() ,
      debugShowCheckedModeBanner: false,
    );
  }
}