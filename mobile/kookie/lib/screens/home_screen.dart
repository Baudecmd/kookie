import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kookie/api/optimization_api_client.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/models/category/CategoryDTO.dart';
import 'package:kookie/models/profile/ProfileDTO.dart';
import 'package:kookie/models/recette/RecetteThumbnailDTO.dart';
import 'package:kookie/repositories/home_repository.dart';
import 'package:kookie/screens/start_cooking.dart';
import 'package:kookie/widgets/card_carousel.dart';
import 'package:kookie/widgets/custom_button.dart';
import 'package:kookie/widgets/custom_dialog.dart';
import 'package:kookie/widgets/custom_drawer.dart';
import 'package:kookie/widgets/search_recipe.dart';

import '../services/storage_util.dart';
import 'start_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late BuildContext dialogContext;
  List<CategoryDTO> categories = [];
  List<RecetteThumbnailDTO> recipes = [];

  HomeRepository homeRepository = HomeRepository();

  Future<void> getDatas() async {
    categories =
        await homeRepository.getAllRecipeCategoriesContainsRecipe() ?? [];
    recipes = await homeRepository.getAllRecipeThumbnails() ?? [];
  }

  @override
  void initState() {
    super.initState();
    StorageUtil.getString(key: 'profile', defValue: '').then((v) {
      if (v == '') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => StartScreen()));
      } else {
        profile = ProfileDTO.fromJson(jsonDecode(v));
        debugPrint('profile $profile');
        getDatas().then((v) => setState(() {}));
      }
    });
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
          preferredSize: Size.fromHeight(categories.isNotEmpty ? 120 : 80),
          child: categories.isNotEmpty
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
      body: buildRecipeTabBarView(),
    );
  }

  Widget buildRecipeTabBarView() {
    return recipes.isNotEmpty
        ? ListView(
            children: <Widget>[
              CardCarousel(
                recipes: recipes,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                widthFactor: 1,
                child: CustomButton(
                  text: "Et c'est parti !",
                  onTap: _startCooking,
                ),
              )
            ],
          )
        : Image(image: AssetImage('assets/images/chargement.gif'));
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
            context: context, delegate: SearchRecipe(listRecetteTmb: recipes))
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

  SingleChildScrollView buildCategoryTabBar(BuildContext context) {
    List<InkWell> categoryTabs = [
      buildCategoryButton(CategoryDTO(name: 'Tout')),
    ];
    if (categories.isNotEmpty) {
      categoryTabs
          .addAll(categories.map((e) => buildCategoryButton(e)).toList());
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categoryTabs,
      ),
    );
  }

  InkWell buildCategoryButton(CategoryDTO category) {
    return InkWell(
      onTap: () {
        changeFilter(category);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SizedBox(
            height: 46,
            child: Center(
                child: Text(category.name,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18.0)))),
      ),
    );
  }

  void changeFilter(CategoryDTO category) {
    if (category.name == 'Tout') {
      homeRepository.getAllRecipeThumbnails().then((value) {
        setState(() {
          recipes = value ?? [];
        });
      });
    } else {
      homeRepository.getAllRecipeThumbnailsByCategory(category).then((value) {
        setState(() {
          recipes = value ?? [];
        });
      });
    }
  }

  _startCooking() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => CustomDialog(),
    );
    dialogContext = context;
    OptimizationApiClient().optimizeSession().then((v) {
      Navigator.pop(dialogContext);
      if (v == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Pas de recettes choisies'),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StartCooking(listStepDTO: v),
          ),
        );
      }
    });
  }
}
