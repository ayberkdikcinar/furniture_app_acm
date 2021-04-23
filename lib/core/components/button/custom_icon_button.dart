import 'package:flutter/material.dart';
import 'package:furniture_app/core/extension/context_extension.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () => onPressed,
      color: context.theme.hoverColor,
      iconSize: context.mediumValue,
    );
  }
}
