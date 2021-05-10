import 'package:flutter/material.dart';
import 'package:kookie/screens/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  _buildProfileOption(String title, onTap) {
    return ListTile(
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomeScreen())),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(
                'Mon profil',
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Détails personnels'),
                  Text('Changer'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(),
                child: Row(
                  children: [
                    Image(
                      width: 200,
                      image: AssetImage('assets/images/kookie.png'),
                    ),
                    Column(
                      children: [
                        Text('Francis Dupont'),
                        Text('francis.dupont@mel.fr'),
                        Text('35 Recettes'),
                        Text('135 Favoris'),
                      ],
                    )
                  ],
                ),
              ),
              _buildProfileOption('Mes Ustensiles', () {}),
              _buildProfileOption('Mes Appareils', () {}),
              _buildProfileOption('A propos', () {}),
              _buildProfileOption('Faire une donation', () {}),
            ],
          ),
        ),
      ),
    );
  }
}
