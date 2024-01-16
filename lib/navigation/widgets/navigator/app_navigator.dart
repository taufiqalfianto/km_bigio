import 'package:flutter/material.dart';
import 'package:rick_and_morty/navigation/routes/app_route.dart';
import 'package:rick_and_morty/navigation/widgets/navigator/bottom_navigation_bar.dart';
import 'package:rick_and_morty/public/screens/favorite_characters_page.dart';
import 'package:rick_and_morty/public/screens/home_screen.dart';
import 'package:rick_and_morty/public/screens/not_found_screen.dart';
import 'package:rick_and_morty/public/screens/search_character_page.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  Widget view = const HomeScreen();

  void navigateTo(AppRoute route) {
    setState(() {
      switch (route) {
        case AppRoute.home:
          view = const HomeScreen();
        case AppRoute.notFound:
          view = const NotFoundScreen();
        case AppRoute.favoriteCharacters:
          view = const FavoriteCharactersPage();
        case AppRoute.characterSearch:
          view = const SearchCharacterPage();
        default:
          view = const NotFoundScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: view,
      appBar: AppBar(
        title: const Text(
          "Rick and Morty Universe",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ),
      bottomNavigationBar: EnhancedBottomNavigationBar(navigateTo: navigateTo),
    );
  }
}
