// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ColorChangerApp());
}

class ColorChangerApp extends StatelessWidget {
  const ColorChangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Color Changer', home: ColorChangerScreen());
  }
}

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  // Default random color
  Color _color = Colors.blue;

  // List of gradient directions represented by begin and end alignments
  final List<Map<String, Alignment>> _directions = [
    {'begin': Alignment.topCenter, 'end': Alignment.bottomCenter}, // Vertical
    {'begin': Alignment.centerLeft, 'end': Alignment.centerRight}, // Horizontal
    {
      'begin': Alignment.topLeft,
      'end': Alignment.bottomRight,
    }, // Left-to-Right Diagonal
    {
      'begin': Alignment.topRight,
      'end': Alignment.bottomLeft,
    }, // Right-to-Left Diagonal
  ];

  int _directionIndex = 0;

  // Generate a random color
  void _changeColor() {
    setState(() {
      _color = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1,
      );
    });
  }

  // Cycle to the next gradient direction
  void _changeDirection() {
    setState(() {
      _directionIndex = (_directionIndex + 1) % _directions.length;
    });
  }
}
