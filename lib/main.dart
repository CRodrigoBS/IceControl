import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ice_control/constants.dart';
import 'package:ice_control/controllers/menu_app_controller.dart';
import 'package:ice_control/pages/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme:
      ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
     home: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuAppController(),
        ),
      ],
      child: const MainScreen(),
      ),
    );

  }
}
