import 'package:furniture_app/core/extension/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/init/localization/locale_keys.g.dart';

class TexButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final double? textSize;
  const TexButtonWidget({
    Key? key,
    required this.onPressed,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.normalValue))),
      ),
      child: Text(LocaleKeys.buy.tr(), style: TextStyle(color: context.theme.highlightColor, fontSize: textSize)),
    );
  }
}
