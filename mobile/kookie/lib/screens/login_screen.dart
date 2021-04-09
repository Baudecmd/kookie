import 'package:flutter/material.dart';
import 'package:kookie/controllers/text_form_field.dart';
import 'package:kookie/widgets/custom_button.dart';
import 'package:kookie/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
                validator: isEmail,
              ),
              SizedBox(height: 30),
              CustomTextField(
                hintText: 'Password',
                isObscureText: true,
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
    );
  }

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }
}
