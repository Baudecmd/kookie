import 'package:flutter/material.dart';
import 'package:kookie/models/category/CategoryDTO.dart';
import 'package:kookie/models/recette/RecetteThumbnailDTO.dart';
import 'package:kookie/repositories/home_repository.dart';
import 'package:kookie/screens/start_screen.dart';
import 'package:kookie/services/storage_util.dart';
import 'package:kookie/widgets/Search.dart';
import 'package:kookie/widgets/card_carousel.dart';
import 'package:kookie/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<CategoryDTO>? categories;
  late List<RecetteThumbnailDTO>? recipes;

  HomeRepository homeRepository = HomeRepository();

  isLogged() async {
    String value = await StorageUtil.getString(key: 'token');
    if (value == '') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => StartScreen()));
    }
  }

  @override
  void initState() async {
    super.initState();
    isLogged();
    categories = await homeRepository.getAllRecipeCategories();
    recipes = await homeRepository.getAllRecipeThumbnails();
    _tabController = TabController(length: 4, vsync: this);
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
          child: categories != null
              ? Column(
                  children: [
                    buildSearchBar(context),
                    buildCategoryTabBar(context),
                  ],
                )
              : buildSearchBar(context),
        ),
      ),
      drawer: CustomDrawer(),
      body: categories != null
          ? buildRecipeTabBarView()
          : ListView(
              children: <Widget>[
                CardCarousel(
                  recipes: recipes!,
                )
              ],
            ),
    );
  }

  TabBarView buildRecipeTabBarView() {
    List<ListView> categoryTabBarViews = [
      ListView(
        children: <Widget>[
          CardCarousel(
            recipes: recipes!,
          )
        ],
      ),
    ];
    if (categories != null) {
      for (CategoryDTO c in categories!) {
        buildListViewFromCategory(c)
            .then((value) => categoryTabBarViews.add(value));
      }
    }
    return TabBarView(
      controller: _tabController,
      children: categoryTabBarViews,
    );
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

  TabBar buildCategoryTabBar(BuildContext context) {
    List<Tab> categoryTabs = [
      Tab(
        text: 'Tout',
      ),
    ];
    if (categories != null) {
      categoryTabs.addAll(categories!
          .map((e) => Tab(
                text: e.name,
              ))
          .toList());
    }
    return TabBar(
      controller: _tabController,
      labelColor: Theme.of(context).primaryColor,
      labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontSize: 18.0),
      isScrollable: true,
      tabs: categoryTabs,
    );
  }
}
