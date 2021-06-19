import 'package:flutter/material.dart';
import 'package:kookie/datas/data.dart';
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
                  validator: (_) {
                    if (password == null) {
                      return 'Ce champ est obligatoire';
                    } else if (password!.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                  onChanged: (String value) {
                    password = value;
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
      profile = await loginRepository
          .login(CredentialDTO(username: username, password: password));
      if (profile != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    }
  }
}
