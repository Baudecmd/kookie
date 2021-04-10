import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kookie/controllers/text_form_field.dart';
import 'package:kookie/models/user/UserDTO.dart';
import 'package:kookie/screens/signup_userinfo_screen.dart';
import 'package:kookie/widgets/custom_button.dart';
import 'package:kookie/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final UserDTO user = UserDTO();
  var passwordValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      width: 0.6 * MediaQuery.of(context).size.width,
                      image: AssetImage('assets/images/logo.png')),
                ],
              ),
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Email',
                      validator: (String value) => {
                        if (isEmail(value) == null) {user.username = value}
                      },
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      hintText: 'Password',
                      isObscureText: true,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please enter a password";
                        } else if (value.length < 8) {
                          return "Password length must be at least 8 characters long";
                        } else {
                          passwordValue = value;
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      hintText: 'Verify password',
                      isObscureText: true,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please enter a password";
                        } else if (value.length < 8) {
                          return "Password length must be at least 8 characters long";
                        } else if (value != passwordValue) {
                          return "Password must be the same as above";
                        } else {
                          user.password = value;
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    CustomButton(text: 'SUIVANT', onTap: _submitForm)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => SignUpUserInfoScreen(user)));
    }
  }
}
