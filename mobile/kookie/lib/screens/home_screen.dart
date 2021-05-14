import 'package:flutter/material.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/screens/start_screen.dart';
import 'package:kookie/services/storage_util.dart';
import 'package:kookie/widgets/card_carousel.dart';
import 'package:kookie/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  //late PageController _pageController;

  isLogged() async {
    String value = await StorageUtil.getString(key: 'token');
    if (value == '') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => StartScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    isLogged();
    _tabController = TabController(length: 4, vsync: this);
    //_pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Container(
          alignment: AlignmentDirectional.centerEnd,
          child: Image(
            height: 50,
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 18.0),
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: 'Tous',
            ),
            Tab(
              text: 'Végétarien',
            ),
            Tab(
              text: 'Végétaliens',
            ),
            Tab(
              text: 'Patisserie',
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            children: <Widget>[
              //FollowingUsers(),
              CardCarousel(posts: posts)
            ],
          ),
          ListView(
            children: <Widget>[
              //FollowingUsers(),
              CardCarousel(posts: posts)
            ],
          ),
          ListView(
            children: <Widget>[
              //FollowingUsers(),
              CardCarousel(posts: posts)
            ],
          ),
          ListView(
            children: <Widget>[
              //FollowingUsers(),
              CardCarousel(posts: posts)
            ],
          ),
        ],
      ),
    );
  }
}
