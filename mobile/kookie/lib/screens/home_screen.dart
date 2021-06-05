import 'package:flutter/material.dart';
import 'package:kookie/models/category/CategoryDTO.dart';
import 'package:kookie/models/recette/RecetteThumbnailDTO.dart';
import 'package:kookie/repositories/home_repository.dart';
import 'package:kookie/widgets/Search.dart';
import 'package:kookie/widgets/card_carousel.dart';
import 'package:kookie/widgets/custom_drawer.dart';

import '../services/storage_util.dart';
import 'start_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<CategoryDTO> categories = [];
  List<RecetteThumbnailDTO> recipes = [];
  List<ListView> categoryTabBarViews = [];
  List<Tab> categoryTabBar = [];

  HomeRepository homeRepository = HomeRepository();

  @override
  void initState() {
    super.initState();
    StorageUtil.getString(key: 'token', defValue: '').then((v) {
      if (v == '') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => StartScreen()));
      } else {
        /* LOAD AND BUILD ASYNC WIDGET BEFORE SCREEN BUILD */
        _tabController = TabController(length: 0, vsync: this);
        getDatas().then((v) => setState(() {}));
      }
    });
  }

  /* LOAD THEN BUILD ASYNC WIDGET BEFORE SCREEN BUILD */
  Future<void> getDatas() async {
    categories = await homeRepository.getAllRecipeCategories() ?? [];
    recipes = await homeRepository.getAllRecipeThumbnails() ?? [];
    _tabController = TabController(length: categories.length + 1, vsync: this);
    await buildTabBar();
  }

  Future<void> buildTabBar() async {
    if (categories.isNotEmpty) {
      categoryTabBarViews = [
        ListView(
          children: <Widget>[
            CardCarousel(
              recipes: recipes,
            )
          ],
        ),
      ];
      for (CategoryDTO c in categories) {
        categoryTabBarViews.add(await buildListViewFromCategory(c));
      }

      categoryTabBar = [
        Tab(
          text: 'Tout',
        ),
      ];
      categoryTabBar.addAll(categories.map((e) => Tab(text: e.name)).toList());
    }
  }

  Future<ListView> buildListViewFromCategory(CategoryDTO category) async {
    List<RecetteThumbnailDTO>? recipesFromCategory =
        await homeRepository.getAllRecipeThumbnailsByCategory(category);
    return ListView(
      children: <Widget>[
        CardCarousel(recipes: recipesFromCategory!),
      ],
    );
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              buildSearchBar(context),
              categoryTabBar.isNotEmpty
                  ? buildCategoryTabBar(context)
                  : SizedBox(),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body:
          categoryTabBarViews.isNotEmpty ? buildRecipeTabBarView() : SizedBox(),
    );
  }

  TextButton buildSearchBar(BuildContext context) {
    return TextButton(
      onPressed: () => {
        showSearch(
            context: context,
            delegate: Search(listExample: ['test1', 'test2', 'pastest1']))
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
            leading: Icon(
              Icons.search,
              color: Colors.black,
            ),
            title: Text('Rechercher')),
      ),
    );
  }

  TabBarView buildRecipeTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: categoryTabBarViews,
    );
  }

  TabBar buildCategoryTabBar(BuildContext context) {
    return TabBar(
      controller: _tabController,
      labelColor: Theme.of(context).primaryColor,
      labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontSize: 18.0),
      isScrollable: true,
      tabs: categoryTabBar,
    );
  }
}
