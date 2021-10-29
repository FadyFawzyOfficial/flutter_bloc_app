import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/constants/strings.dart';
import 'package:flutter_bloc_app/presentation/screens/character_details_screen.dart';

import 'presentation/screens/characters_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());
      case characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());
    }
  }
}
