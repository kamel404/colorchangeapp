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

  @override
  Widget build(BuildContext context) {
    // Extract current gradient directions
    final currentDirection = _directions[_directionIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: currentDirection['begin']!,
            end: currentDirection['end']!,
            colors: [
              _color,
              Colors.white,
            ], // You can adjust the gradient colors as needed
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Display the RGB values
              Text(
                'R: ${_color.r}, G: ${_color.g}, B: ${_color.b}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Change Color Button
              ElevatedButton(
                onPressed: _changeColor,
                child: Text('Change Color'),
              ),
              SizedBox(height: 10),
              // Change Direction Button
              ElevatedButton(
                onPressed: _changeDirection,
                child: Text('Change Direction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
