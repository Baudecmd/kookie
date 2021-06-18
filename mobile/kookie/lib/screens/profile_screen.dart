import 'package:flutter/material.dart';
import 'package:kookie/datas/data.dart';

import 'my_ustensils_screen.dart';

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
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mon profil',
                style: TextStyle(fontSize: 34),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Détails personnels',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Changer',
                    style: TextStyle(color: Color(0xFF38784D), fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
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
                        Text(
                          '${profile!.firstName} ${profile!.lastName}',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '${profile!.user!.username}',
                          style:
                              TextStyle(color: Color(0xFFADADAF), fontSize: 15),
                        ),
                        Wrap(children: [
                          Icon(
                            Icons.sticky_note_2_outlined,
                            color: Color(0xFFADADAF),
                          ),
                          Text(
                            '35 Recettes',
                            style: TextStyle(
                                color: Color(0xFFADADAF), fontSize: 15),
                          ),
                        ]),
                        Wrap(children: [
                          Icon(
                            Icons.favorite_border_sharp,
                            color: Color(0xFFADADAF),
                          ),
                          Text(
                            '135 Favoris',
                            style: TextStyle(
                                color: Color(0xFFADADAF), fontSize: 15),
                          ),
                        ]),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  _buildProfileOption('Mes Ustensiles', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyUstensilsScreen()),
                    );
                  }),
                  _buildProfileOption('A propos', () {}),
                  _buildProfileOption('Faire une donation', () {})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
