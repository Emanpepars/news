import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/provider/home_provider.dart';
import 'package:news/provider/theme_provider.dart';
import 'package:news/screens/search_news_screen.dart';
import 'package:news/screens/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';
import '../screens/categories_screen.dart';
import '../screens/news_screen.dart';
import '../shared/components/const.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "news layout";
  const HomeLayout({super.key});
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  String? enterValue;
  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: isSearch
          ? null
          : DrawerWidget(
              homeProvider.onDrawerClicked,
            ),
      appBar: isSearch
          ? AppBar(
              backgroundColor: homeProvider.categoryModel == null
                  ? Theme.of(context).appBarTheme.backgroundColor
                  : homeProvider.categoryModel?.color,
              title: Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: TextField(
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: homeProvider.categoryModel?.color),
                  controller: searchController,
                  cursorColor: homeProvider.categoryModel == null
                      ? primaryLightColor
                      : homeProvider.categoryModel?.color,
                  decoration: InputDecoration(
                    hintText: "Search Articles",
                    hintStyle: GoogleFonts.ptSerif(
                        fontSize: 16, color: Colors.black54),
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          searchController = TextEditingController();
                          isSearch = false;
                        });
                      },
                      icon: Icon(
                        Icons.close,
                        color: homeProvider.categoryModel == null
                            ? primaryLightColor
                            : homeProvider.categoryModel?.color,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: homeProvider.categoryModel == null
                            ? primaryLightColor
                            : homeProvider.categoryModel?.color,
                      ),
                      onPressed: () {},
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      enterValue = value;
                    });
                  },
                ),
              ),
            )
          : AppBar(
              backgroundColor: homeProvider.categoryModel == null
                  ? Theme.of(context).appBarTheme.backgroundColor
                  : homeProvider.categoryModel?.color,
              title: Text(
                homeProvider.categoryModel == null
                    ? "News"
                    : homeProvider.categoryModel!.name,
              ),
              iconTheme: homeProvider.categoryModel == null
                  ? Theme.of(context).appBarTheme.iconTheme
                  : Theme.of(context)
                      .appBarTheme
                      .iconTheme
                      ?.copyWith(color: Colors.white),
              titleTextStyle: homeProvider.categoryModel == null
                  ? Theme.of(context).appBarTheme.titleTextStyle
                  : Theme.of(context)
                      .appBarTheme
                      .titleTextStyle
                      ?.copyWith(color: Colors.white),
              actions: [
                homeProvider.categoryModel == null
                    ? InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          themeProvider.changeTheme(
                              themeProvider.themeMode == ThemeMode.light
                                  ? ThemeMode.dark
                                  : ThemeMode.light);
                        },
                        child: themeProvider.themeMode == ThemeMode.light
                            ? const ImageIcon(
                                AssetImage("assets/images/moon_icon.png"),
                                size: 20,
                              )
                            : const ImageIcon(
                                AssetImage(
                                  "assets/images/sun_icon.png",
                                ),
                                size: 25,
                                color: Colors.white,
                              ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isSearch = true;
                            });
                          },
                          icon: const Icon(Icons.search),
                        ),
                      ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
      body: isSearch
          ? SearchScreen(homeProvider.categoryModel!, enterValue)
          : homeProvider.categoryModel == null
              ? CategoriesScreen(homeProvider.onCategorySelected)
              : NewsScreen(homeProvider.categoryModel!),
    );
  }
}
