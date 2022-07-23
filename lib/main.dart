import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double x = 0, y = 0, amplitude = 0.3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191d2d),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..rotateX(x)
              ..rotateY(y),
            child: GestureDetector(
              onPanUpdate: (details) {
                if (y - details.delta.dx < 0) {
                  setState(() {
                    y = max(y - details.delta.dx / 100, -amplitude);
                  });
                } else {
                  setState(() {
                    y = min(y - details.delta.dx / 100, amplitude);
                  });
                }

                if (x + details.delta.dy < 0) {
                  setState(() {
                    x = max(x + details.delta.dy / 100, -amplitude);
                  });
                } else {
                  setState(() {
                    x = min(x + details.delta.dy / 100, amplitude);
                  });
                }
              },
              child: Container(
                width: double.infinity,
                height: 390.0,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("card.png"),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xaa5864f8),
                        blurRadius: 50.0,
                        offset: Offset(x * 10, -x * 80)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
