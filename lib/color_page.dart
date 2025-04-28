import 'package:flutter/material.dart';
import 'dart:math' as math;

const int bit = 256;

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  Color _backgroundColor = Color(0xFF222831);
  Color _textColor = Color(0xFFFF9149);


  void _changeColor() {
    setState(() {
      _changeBackgroundColor();
      _changeTextColor();
    });

    print(_backgroundColor);
    print(_textColor);
  }

  void _changeBackgroundColor() {
     _backgroundColor = createRandomColor();
  }
  void _changeTextColor() {
     _textColor = _invertColor(_backgroundColor);
  }

  Color createRandomColor() {
    return Color.fromARGB(
      math.Random().nextInt(bit),
      math.Random().nextInt(bit),
      math.Random().nextInt(bit),
      math.Random().nextInt(bit),
    );
  }

  Color _invertColor(Color color) {
    Color newColor = Color.fromARGB(255, color.green, color.blue, color.red);
    return newColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _changeColor,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          color: _backgroundColor,
          child: Center(
            child: Text(
              "Hello there",
              style: TextStyle(
                color: _textColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
