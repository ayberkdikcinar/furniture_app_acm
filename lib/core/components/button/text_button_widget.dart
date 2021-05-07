import 'package:furniture_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class TexButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final double? textSize;
  final String? text;
  const TexButtonWidget({
    Key? key,
    required this.onPressed,
    this.textSize,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.normalValue))),
      ),
      child: Text(text ?? '', style: TextStyle(color: context.theme.highlightColor, fontSize: textSize)),
    );
  }
}
