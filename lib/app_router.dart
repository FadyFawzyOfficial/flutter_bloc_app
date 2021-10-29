import 'package:flutter/material.dart';

import 'presentation/screens/characters_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const CharactersScreen());
    }
  }
}
