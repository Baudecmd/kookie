import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kookie/screens/start_screen.dart';
import 'package:kookie/widgets/custom_button.dart';

class ConfirmationScreen extends StatefulWidget{
  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_page_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Image(
                width: 0.6 * MediaQuery.of(context).size.width,
                image: AssetImage('assets/images/logo.png')
            ),
            SizedBox(height: 30),
            Text("Votre inscription est terminée!"),
            SizedBox(height: 60),
            CustomButton(
                text: "C'est parti !",
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => StartScreen()
                    )
                ),
            )
          ],
        ),
      )
    );
  }
}