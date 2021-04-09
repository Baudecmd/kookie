import 'package:flutter/material.dart';
import 'package:kookie/screens/confirmation_screen.dart';
import 'package:kookie/widgets/custom_button.dart';
import 'package:kookie/widgets/custom_text_field.dart';

class SignUpUserInfoScreen extends StatefulWidget {
  @override
  _SignUpUserInfoScreenState createState() => _SignUpUserInfoScreenState();
}

class _SignUpUserInfoScreenState extends State<SignUpUserInfoScreen> {

  final _formKey = GlobalKey<FormState>();

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
              Image(
                  width: 0.6 * MediaQuery.of(context).size.width,
                  image: AssetImage('assets/images/logo.png')
              ),
              Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          hintText: 'Nom',
                          validator: (String value) {
                            var validCharacters = RegExp(r'^[a-zA-Z]+$');
                            if(validCharacters.hasMatch(value)){
                              return null;
                            }
                            else if(value.isEmpty){
                              return "Name field is empty";
                            }
                            else{
                              return "That doesn't look like a name...";
                            }
                          },
                        ),
                        SizedBox(height: 30),
                        CustomTextField(
                          hintText: 'Prénom',
                          validator: (String value) {
                            var validCharacters = RegExp(r'^[a-zA-Z]+$');
                            if(validCharacters.hasMatch(value)){
                              return null;
                            }
                            else if(value.isEmpty){
                              return "Firstname field is empty";
                            }
                            else{
                              return "That doesn't look like a firstname...";
                            }
                          },
                        ),
                        SizedBox(height: 30),
                        CustomButton(text: 'VALIDER', onTap: _submitForm)
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  _submitForm(){
    if(_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ConfirmationScreen()
          )
      );
    }
  }
}
