import 'package:flutter/material.dart';
import '../../theme/dotty_colors.dart';

class DottyIcon extends StatelessWidget {
  const DottyIcon(this.icon, {super.key, this.size = 24, this.color});

  final IconData icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: color ?? DottyColors.text);
  }
}

class DottyEmojiIcon extends StatelessWidget {
  const DottyEmojiIcon(this.emoji, {super.key, this.size = 24});

  final String emoji;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(emoji, style: TextStyle(fontSize: size));
  }
}
