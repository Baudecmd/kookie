import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kookie/models/profile/ProfileDTO.dart';
import 'package:kookie/models/user/CredentialDTO.dart';
import 'package:kookie/repositories/login_repository.dart';
import 'package:kookie/widgets/custom_button.dart';
import 'package:kookie/widgets/custom_text_field.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final LoginRepository loginRepository = LoginRepository();
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/login_page_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 0.6 * MediaQuery.of(context).size.width,
                  image: AssetImage('assets/images/logo.png'),
                ),
                SizedBox(height: 60),
                CustomTextField(
                    hintText: 'Email',
                    onChanged: (String value) {
                      username = value;
                      return '';
                    }),
                SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Password',
                  isObscureText: true,
                  onChanged: (String value) {
                    password = value;
                    return '';
                  },
                ),
                SizedBox(height: 30),
                CustomButton(text: 'SE CONNECTER', onTap: _submitForm),
                SizedBox(height: 60),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(
                          color: Color(0xFF38784D),
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _submitForm() async {
    if (_formKey.currentState!.validate()) {
      ProfileDTO profile = await loginRepository
          .login(CredentialDTO(username: username, password: password));
      log('username : $username password: $password');
      //todo : store token

      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    }
  }
}
