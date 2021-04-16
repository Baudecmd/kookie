import 'package:flutter/material.dart';
import 'package:kookie/models/profile/ProfileDTO.dart';
import 'package:kookie/models/user/UserDTO.dart';
import 'package:kookie/repositories/sign_up_repository.dart';
import 'package:kookie/screens/confirmation_screen.dart';
import 'package:kookie/widgets/custom_button.dart';
import 'package:kookie/widgets/custom_text_field.dart';

class SignUpUserInfoScreen extends StatefulWidget {
  final UserDTO user;

  SignUpUserInfoScreen(this.user);

  @override
  _SignUpUserInfoScreenState createState() => _SignUpUserInfoScreenState();
}

class _SignUpUserInfoScreenState extends State<SignUpUserInfoScreen> {

  final _formKey = GlobalKey<FormState>();
  final SignUpRepository repository = SignUpRepository();
  String? firstName;
  String? lastName;

  @override
  void initState() {
    super.initState();
  }

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
                          onChanged: (String value) {
                        var validCharacters = RegExp(r'^[a-zA-Z]+$');
                        if (validCharacters.hasMatch(value)) {
                          lastName = value;
                          return null;
                        } else if (value.isEmpty) {
                          return "Name field is empty";
                        } else {
                          return "Alphabetical characters only !";
                        }
                          },
                        ),
                        SizedBox(height: 30),
                        CustomTextField(
                          hintText: 'Prénom',
                          onChanged: (String value) {
                        var validCharacters = RegExp(r'^[a-zA-Z]+$');
                        if (validCharacters.hasMatch(value)) {
                          firstName = value;
                          return null;
                        } else if (value.isEmpty) {
                          return "Firstname field is empty";
                        } else {
                          return "Alphabetical characters only !";
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

  _submitForm() async {
    if (_formKey.currentState!.validate()) {
      await repository.createProfile(ProfileDTO(
          firstName: firstName, lastName: lastName, user: widget.user));
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => ConfirmationScreen()));
    }
  }
}
