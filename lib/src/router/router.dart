import 'package:book_finder_flutter_demo/src/auth/index.dart';
import 'package:book_finder_flutter_demo/src/books_browser/index.dart';
import 'package:book_finder_flutter_demo/src/onboarding/index.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingScreen(),
      redirect: (context, state) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        bool? showOnboarding = prefs.getBool('showOnboarding');
        if (showOnboarding == null) {
          return null;
        }
        if (!showOnboarding) {
          return '/home';
        }
        return null;
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen()
    ),
    GoRoute(
      path: '/search-results/:query',
      builder: (context, state) => SearchScreenResults(
        query: state.pathParameters['query'] ?? ''
      )
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen()
    ),
    GoRoute(
      path: '/my-account',
      builder: (context, state) => const MyAccountScreen()
    ),
    
  ]
);