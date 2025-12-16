import 'package:flutter/material.dart';
import 'dart:math';

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color bgColor =Colors.black;
  List<Color> lsColor = [
    Colors.red,
    Colors.pink,
    Colors.cyan,
    Colors.teal,
    Colors.yellow,
    Colors.blue,

  ];
  @override
  void initState(){
    super.initState();
    bgColor = Colors.pink;
  }
  void _ChangeRandomColor(){
    setState(() {
      var random = Random();
      bgColor = lsColor[random.nextInt(lsColor.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Change Color App"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: bgColor
        ),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(onPressed: _ChangeRandomColor, child: Text("Change"))
            ],
            )
          ],
        ),
      ),
    );
  }
}