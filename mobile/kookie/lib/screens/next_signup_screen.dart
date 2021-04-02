import 'package:flutter/material.dart';
import 'package:kookie/widgets/custom_button.dart';
import 'package:kookie/widgets/custom_text_field.dart';

class NextSignupScreen extends StatefulWidget {
  @override
  _NextSignupScreenState createState() => _NextSignupScreenState();
}

class _NextSignupScreenState extends State<NextSignupScreen> {
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
                hintText: 'Prenom',
              ),
              SizedBox(height: 30),
              CustomTextField(
                hintText: 'Nom',
              ),
              SizedBox(height: 30),
              CustomButton(text: 'Valider', onTap: _submitForm),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO : IL FAUT SAUVEGARDER SON NOM ET PRENOM
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }
}
