import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final onTap;

  CustomButton({required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: 200,
          height: 56,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
