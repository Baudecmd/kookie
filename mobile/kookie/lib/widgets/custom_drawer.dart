import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kookie/screens/favourites_screen.dart';
import 'package:kookie/screens/my_recipes_screen.dart';
import 'package:kookie/screens/profile_screen.dart';
import 'package:kookie/screens/start_screen.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        child: Stack(alignment: Alignment.centerRight, children: [
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                _buildDrawerOption(
                    Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                    ),
                    'Profil',
                    () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProfileScreen(
                                /*user: currentUser,*/
                                )))),
                _buildDrawerOption(
                    Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    'Mes Favoris',
                    () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => FavouritesScreen()))),
                _buildDrawerOption(
                    Icon(
                      Icons.sticky_note_2_outlined,
                      color: Colors.white,
                    ),
                    'Mes Recettes',
                    () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => MyRecipesScreen()))),
                Expanded(
                    child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: _buildDrawerOption(
                      Icon(
                        Icons.directions_run,
                        color: Colors.white,
                      ),
                      'Se déconnecter',
                      () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => StartScreen()))),
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image(
              height: MediaQuery.of(context).size.height * 0.7,
              image: AssetImage('assets/images/drawer.png'),
            ),
          ),
        ]),
      ),
    );
  }
}
