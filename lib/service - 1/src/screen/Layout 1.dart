import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class Layout extends StatefulWidget {
  const Layout({super.key});
  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.red;
  Color _color1 = Colors.tealAccent;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  Timer? _timer;
  bool _isAnimationRunning = true;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      final random = Random();

      setState(() {
        _width = random.nextInt(500).toDouble();
        _height = random.nextInt(500).toDouble();

        _color = Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1,
        );

        _color1 = Color.fromRGBO(
          random.nextInt(3000),
          random.nextInt(2000),
          random.nextInt(2999),
          1,
        );

        _borderRadius = BorderRadius.circular(
          random.nextInt(100).toDouble(),
        );
      });
    });
  }

  void _stopAnimation() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            right: 158,
            child: AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              duration: const Duration(seconds: 9),
              curve: Curves.decelerate,
            ),
          ),
          Positioned(
            right: 158,
            top: 69,
            child: AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color1,
                borderRadius: _borderRadius,
              ),
              duration: const Duration(seconds: 9),
              curve: Curves.decelerate,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 100,
              sigmaY: 100,
            ),
            child: Container(
              decoration: const BoxDecoration(color: Colors.transparent),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_isAnimationRunning) {
            _stopAnimation();
          } else {
            _startAnimation();
          }
          setState(() {
            _isAnimationRunning = !_isAnimationRunning;
          });
        },
        child: _isAnimationRunning
            ? const Icon(Icons.stop)
            : const Icon(Icons.play_arrow_sharp),
      ),
    );
  }
}
