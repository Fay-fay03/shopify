import 'package:flutter/material.dart';

import '../constants/constant_page.dart';


class CustomTextButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  const CustomTextButton({super.key, required this.text, required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        child: Text(text,
        style: const TextStyle(fontSize: titleFontSize,
        color: redColor,
        fontWeight: titleFontWeight
        ),
        ),
      ),
    );
  }
}
