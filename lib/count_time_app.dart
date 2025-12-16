import 'dart:async';
import 'package:flutter/material.dart';

class CountDownTimeApp extends StatefulWidget {
  const CountDownTimeApp({super.key});

  @override
  State<CountDownTimeApp> createState() => _CountDownTimeAppState();
}

class _CountDownTimeAppState extends State<CountDownTimeApp> {
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _isRunning = false;

  void _startCountdown() {
    if (_controller.text.isEmpty) return;

    final input = int.tryParse(_controller.text);
    if (input == null || input <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nhập số giây cần đếm')),
      );
      return;
    }

    setState(() {
      _remainingSeconds = input;
      _isRunning = true;
    });

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        timer.cancel();
        setState(() => _isRunning = false);
        _showEndDialog();
      }
    });
  }

  void _stopCountdown() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _resetCountdown() {
    _timer?.cancel();
    setState(() {
      _remainingSeconds = 0;
      _isRunning = false;
      _controller.clear();
    });
  }

  void _showEndDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('⏰ Hết thời gian!'),
        content: const Text('Đếm ngược đã kết thúc.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// 🕒 Chuyển giây thành định dạng mm:ss
  String _formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    if (minutes > 0) {
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '$seconds';
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isFinished = _remainingSeconds == 0 && !_isRunning;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Bộ Đếm Ngược Thời Gian'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              enabled: !_isRunning,
              decoration: InputDecoration(
                labelText: 'Nhập số giây cần đếm',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: const Icon(Icons.timer),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            // Hiển thị thời gian
            Text(
              _formatTime(_remainingSeconds),
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: isFinished
                    ? Colors.red
                    : _isRunning
                        ? Colors.green
                        : Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _isRunning ? null : _startCountdown,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Bắt đầu'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: _isRunning ? _stopCountdown : null,
                  icon: const Icon(Icons.pause),
                  label: const Text('Dừng'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: _resetCountdown,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
