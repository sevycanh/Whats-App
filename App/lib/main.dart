import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/NewScreens/LandingScreen.dart';
import 'package:whats_app/screens/CameraScreen.dart';
import 'package:whats_app/screens/LoginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 2, 97, 86),  
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 2, 97, 86),
          foregroundColor: Colors.white,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab
        ),
        fontFamily: "OpenSans",
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
