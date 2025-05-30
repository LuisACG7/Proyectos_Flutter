import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2025/firebase_options.dart';
import 'package:pmsn2025/screens/catalog_screen.dart';
import 'package:pmsn2025/screens/dashboard_screen.dart';
import 'package:pmsn2025/screens/detail_popular_screen.dart';
import 'package:pmsn2025/screens/google_map_screen.dart';
import 'package:pmsn2025/screens/list_students_screen.dart';
import 'package:pmsn2025/screens/popular_screen.dart';
import 'package:pmsn2025/screens/register_screen.dart';
import 'package:pmsn2025/screens/settings_screen.dart';
import 'package:pmsn2025/screens/splash_screen.dart';
import 'package:pmsn2025/screens/todo_screen.dart';
import 'package:pmsn2025/screens/welcome_screen.dart';
import 'package:pmsn2025/utils/global_values.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());

} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GlobalValues.themeApp,
      builder: (context, value, child) {
        return MaterialApp(
          theme: value,
          routes: {
            "/list" : (context) => const ListStudentsScreen(),
            "/dash" : (context) => const DashboardScreen(),
            "/todo" : (context) => const TodoScreen(),
            "/api" : (context) => const PopularScreen(),
            "/map" : (context) => const MapSample(),
            "/detail" : (context) => DetailPopularScreen(),
            "/welcome" : (context) => const WelcomeScreen(),
            "/catalog" : (context) => const CatalogScreen(),
            "/register" : (context) => const RegisterScreen(),
            "/settings" : (context) => const SettingsScreen(),
          },
          title: 'Material App',
          home: SplashScreen()
        );
      }
    );
  }
}