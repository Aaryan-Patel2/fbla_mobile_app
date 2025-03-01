import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'routes/app_routes.dart';

void main() async {
  // Ensure that flutter_dotenv is loaded before the app starts
  // await dotenv.load(fileName: "lib/keys/.env");
  
  // Now, run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ORBIT',
      theme: ThemeData(
        // Add your theme data here
      ),
      initialRoute: AppRoutes.signInScreen,
      routes: AppRoutes.routes,
    );
  }
}