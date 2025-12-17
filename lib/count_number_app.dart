import 'package:flutter/material.dart';

class CountNumberApp extends StatefulWidget {
  const CountNumberApp({super.key});

  @override
  State<CountNumberApp> createState() => _CountNumberAppState();
}

class _CountNumberAppState extends State<CountNumberApp> {
  int count = 0;
  

  void _increment(){
    setState(() {
      count ++;
    });
  }
  void _decrement(){
    setState(() {
      count --;
    });
  }
  void _reset(){
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Back",
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Count Number App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Giá trị hiện tại",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 10,),
          Text(
              "$count",
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),

          const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrement,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    minimumSize: const Size(80, 50),
                  ),
                  child: const Text(
                    "-",
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    minimumSize: const Size(100, 50),
                  ),
                  child: const Text(
                    "Reset",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _increment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(80, 50),
                  ),
                  child: const Text(
                    "+",
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}