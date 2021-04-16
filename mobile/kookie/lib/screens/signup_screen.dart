import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  String? username;
  String? password;

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
                        onChanged: (String value) {
                          username = value;
                          return null;
                        }),
                    SizedBox(height: 30),
                    CustomTextField(
                      hintText: 'Password',
                      isObscureText: true,
                      onChanged: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter a password';
                        } else if (value.length < 8) {
                          return 'Password length must be at least 8';
                        } else {
                          password = value;
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      hintText: 'Verify password',
                      isObscureText: true,
                      onChanged: (String value) {
                        if (value.isEmpty) {
                          return "Please enter a password";
                        } else if (value.length < 8) {
                          return "Password length must be at least 8";
                        } else if (value != password) {
                          return "Password must be the same as above";
                        } else {
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
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => SignUpUserInfoScreen(
                  UserDTO(username: username, password: password))));
    }
  }
}
