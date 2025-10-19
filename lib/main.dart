import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/program_listing_screen.dart';
import 'screens/program_details_screen.dart';
import 'screens/feedback_screen.dart';
import 'theme/app_theme.dart';
import 'models/program.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Programs App',
      theme: AppTheme.lightTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/programs': (context) => ProgramListingScreen(), // non-const to fix previous error
        '/feedback': (context) => const FeedbackScreen(),
        // ProgramDetailsScreen requires a Program object, so we use onGenerateRoute
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final program = settings.arguments as Program;
          return MaterialPageRoute(
            builder: (context) => ProgramDetailsScreen(program: program),
          );
        }
        return null;
      },
    );
  }
}
