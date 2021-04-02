import 'package:flutter/material.dart';
import 'package:kookie/controllers/text_form_field.dart';
import 'package:kookie/widgets/custom_button.dart';
import 'package:kookie/widgets/custom_text_field.dart';

import 'next_signup_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.white),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      width: 0.6 * MediaQuery.of(context).size.width,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                    Text(
                      'Créer un compte',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                CustomTextField(
                  hintText: 'Email',
                  validator: isEmail,
                ),
                SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Password',
                  isObscureText: true,
                ),
                SizedBox(height: 30),
                CustomButton(text: 'SUIVANT', onTap: _submitForm),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO : IL FAUT VERIFIER SI LE MAIL EXISTE OU PAS
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => NextSignupScreen()));
    }
  }
}
