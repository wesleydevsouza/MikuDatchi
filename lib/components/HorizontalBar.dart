import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class HorizontalBar extends StatefulWidget {
  final double value;
  final Color corBG;
  final Color cor;

  const HorizontalBar({
    required this.value,
    required this.corBG,
    required this.cor,
  });

  @override
  _HorizontalBarState createState() => _HorizontalBarState();
}

class _HorizontalBarState extends State<HorizontalBar> {
  @override
  Widget build(BuildContext context) {
    double prog = widget.value * 10.0;
    Color corBG = widget.corBG;
    Color cor = widget.cor;

    return FAProgressBar(
      currentValue: prog,
      displayText: '%',
      progressColor: cor,
      backgroundColor: corBG,
    );
  }
}
