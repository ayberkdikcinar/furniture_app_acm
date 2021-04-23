import 'package:flutter/material.dart';
import 'package:furniture_app/core/extension/context_extension.dart';

class TextButtonCustom extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? color;

  const TextButtonCustom({
    Key? key,
    required this.onPressed,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  _TextButtonCustomState createState() => _TextButtonCustomState();
}

class _TextButtonCustomState extends State<TextButtonCustom> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onPressed();
      },
      style: ButtonStyle(
        backgroundColor: isSelected ? MaterialStateProperty.all(context.theme.accentColor) : MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: Text(
        'category',
        style: TextStyle(color: isSelected ? context.theme.highlightColor : context.theme.accentColor),
      ),
    );
  }
}
