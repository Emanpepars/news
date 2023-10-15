import 'package:flutter/material.dart';
import 'package:news/layout/home_layout.dart';
import 'package:news/provider/home_provider.dart';
import 'package:news/provider/theme_provider.dart';
import 'package:news/screens/article_details_screen.dart';
import 'package:news/screens/onbording.dart';
import 'package:news/screens/search_article_details_screen.dart';
import 'package:news/shared/style/my_theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_)=> HomeProvider()),
      ],
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeProvider =Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: Onboarding.routeName,
      routes: {
        HomeLayout.routeName: (context) => const HomeLayout(),
        ArticlesScreen.routeName: (context) => const ArticlesScreen(),
        SearchArticlesScreen.routeName: (context) => const SearchArticlesScreen(),
        Onboarding.routeName: (context) => const Onboarding(),
      },
    );
  }
}
