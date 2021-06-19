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
  String? password1;
  String? password2;

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
                        validateOnChanged: true,
                        validator: (_) {
                          if (username != null) {
                            if (username!.isEmpty) {
                              return 'Ce champ est obligatoire';
                            }
                            var validCharacters = RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
                            if (!validCharacters.hasMatch(username!)) {
                              return "Veuillez entrer un email valide";
                            }
                            return null;
                          }
                          return 'Ce champ est obligatoire';
                        },
                        onChanged: (String value) {
                          username = value;
                        }),
                    SizedBox(height: 30),
                    CustomTextField(
                      hintText: 'Password',
                      isObscureText: true,
                      validateOnChanged: true,
                      validator: (value) {
                        if (password1 != null) {
                          if (password1!.isEmpty) {
                            return 'Please enter a password';
                          } else if (password1!.length < 8) {
                            return 'Password length must be at least 8';
                          }
                          return null;
                        }
                        return 'Please enter a password';
                      },
                      onChanged: (String value) {
                        password1 = value;
                      },
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                        hintText: 'Verify password',
                        isObscureText: true,
                        validateOnChanged: true,
                        validator: (value) {
                          if (password2 != null) {
                            if (password2!.isEmpty) {
                              return "Please enter a password";
                            } else if (password2!.length < 8) {
                              return "Password length must be at least 8";
                            } else if (password2! != password1) {
                              return "Password must be the same as above";
                            }
                            return null;
                          }
                          return "Please enter a password";
                        },
                        onChanged: (String value) {
                          password2 = value;
                        }),
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
                  UserDTO(username: username, password: password2))));
    }
  }
}
