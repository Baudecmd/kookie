import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final Function? validator;
  final TextEditingController? controller;
  final String hintText;
  final bool isObscureText;

  CustomTextField(
      {this.controller,
      required this.hintText,
      this.isObscureText = false,
      this.validator});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  var _error;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 56,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
      ]),
      child: TextFormField(
        controller: widget.controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          errorText: _error,
          errorStyle: TextStyle(height: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
        obscureText: widget.isObscureText,
        onChanged: (String input) {
          _error = widget.validator!(input);
          setState(() {});
        },
        validator: (input) => widget.validator!(input!),
      ),
    );
  }
}
