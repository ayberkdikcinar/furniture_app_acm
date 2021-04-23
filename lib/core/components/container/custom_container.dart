import 'package:furniture_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final Color? color;

  const CustomContainer({
    Key? key,
    this.height,
    this.child,
    this.color,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        padding: context.paddingLowHorizontal,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(context.lowValue), color: color),
        child: child);
  }
}
