import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/screens/start_screen.dart';
import 'package:kookie/widgets/custom_drawer.dart';
import 'package:kookie/widgets/post_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final storage = new FlutterSecureStorage();
  late TabController _tabController;
  late PageController _pageController;

  isLogged() async {
    String? value = await storage.read(key: 'token');
    if (value == null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => StartScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    isLogged();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        centerTitle: true,
        title: Text('Kookie',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 10.0)),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 18.0),
          tabs: <Widget>[
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'Latest',
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: <Widget>[
          //FollowingUsers(),
          PostCarousel(
              pageController: _pageController, title: 'Post', posts: posts)
        ],
      ),
    );
  }
}
