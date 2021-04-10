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
  final CredentialDTO credential = new CredentialDTO();

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
                  validator: (String value) => {
                    credential.username = value,
                  },
                ),
                SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Password',
                  isObscureText: true,
                  validator: (String value) => {
                    credential.password = value,
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
      ProfileDTO profile = await loginRepository.login(credential);
      log(profile.toString());
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    }
  }
}
