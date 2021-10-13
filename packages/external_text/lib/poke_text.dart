library external_text;
import 'package:flutter/material.dart';

class PokeText extends StatelessWidget {
  PokeText(
    this.text, {
    this.size = 12,
    this.letterSpacing = 3.0,
    this.textColor = Colors.yellow,
    this.outlineColor = Colors.blue,
    this.outline = true,
  });

  final String text;
  final double size;
  final double letterSpacing;
  final Color textColor;
  final Color outlineColor;
  final bool outline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        outline
            ? Text(
                text,
                style: TextStyle(
                  fontFamily: 'Poke-Solid',
                  fontFamilyFallback: ['Poke-Regular'],
                  package: 'external_text',
                  fontSize: size,
                  letterSpacing: letterSpacing,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = outlineColor,
                ),
              )
            : Container(),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Poke-Solid',
            fontFamilyFallback: ['Poke-Regular'],
            package: 'external_text',
            fontSize: size,
            letterSpacing: letterSpacing,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
