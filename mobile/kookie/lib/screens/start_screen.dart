import 'package:flutter/material.dart';
import 'package:kookie/screens/signup_screen.dart';

import 'login_screen.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/start_page_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Image(
              width: 0.6 * MediaQuery.of(context).size.width,
              image: AssetImage('assets/images/logo.png'),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoginScreen())),
                          child: Container(
                            alignment: Alignment.center,
                            height: 52,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF38784D),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 4)
                              ],
                            ),
                            child: Text(
                              'SE CONNECTER',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF38784D),
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SignUpScreen())),
                          child: Container(
                            alignment: Alignment.center,
                            height: 52,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 4)
                              ],
                            ),
                            child: Text(
                              'CREER UN COMPTE',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
