import 'package:flutter/material.dart';

class HorizontalBar extends StatefulWidget {
  final int value;

  HorizontalBar({required this.value});

  @override
  _HorizontalBarState createState() => _HorizontalBarState();
}

class _HorizontalBarState extends State<HorizontalBar> {
  @override
  Widget build(BuildContext context) {
    double barWidth = widget.value.toDouble() * 10.0;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: barWidth,
      height: 20,
      color: Colors.blue,
    );
  }
}
