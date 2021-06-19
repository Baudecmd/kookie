import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final double? width;
  final double? height;
  final String hintText;
  final Function onChanged;
  final Function? validator;
  final bool? validateOnChanged;
  final TextEditingController? controller;
  final bool isObscureText;

  CustomTextField(
      {this.width = 240,
      this.height = 56,
      required this.hintText,
      required this.onChanged,
      this.validator,
      this.validateOnChanged = false,
      this.controller,
      this.isObscureText = false});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
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
          errorText: _errorText,
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
        validator: widget.validator as String? Function(String?)?,
        onChanged: (String input) {
          widget.onChanged(input) as void Function(String)?;
          setState(() {
            _errorText = _validate(input);
          });
        },
      ),
    );
  }

  String? _validate(String? value) {
    if (widget.validateOnChanged! && widget.validator != null) {
      return widget.validator!(value);
    }
  }
}
