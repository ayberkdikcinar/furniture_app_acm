import 'package:furniture_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class TextFieldSearch extends StatelessWidget {
  final double borderRadius;
  final Color? backgrounColor;
  final IconData? prefixIcon;

  final String? hintText;

  const TextFieldSearch({
    Key? key,
    required this.borderRadius,
    this.backgrounColor = Colors.white,
    this.prefixIcon,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius), borderSide: BorderSide.none),
          filled: true,
          fillColor: backgrounColor,
          prefixIcon: Icon(prefixIcon),
          hintText: hintText,
          contentPadding: EdgeInsets.all(context.lowValue)),
    );
  }
}
