import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

class OutlineBtn extends StatelessWidget {
  OutlineBtn({Key? key, required this.text, required this.onTap})
      : super(key: key);
  final String text;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.colorBlue,
          fontSize: 16,
          height: 1.42,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: AppColors.colorBlue,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
