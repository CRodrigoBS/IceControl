//esta es la pagina princiapl lo que se muestra en la aplicacion

import 'package:flutter/material.dart';
import 'package:ice_control/controllers/menu_app_controller.dart';//importa el archivo models_info_cards
import 'package:ice_control/pages/dashboard.screen.dart';//importa el archivo
import 'package:ice_control/witgets/side_menu.dart';
import 'package:ice_control/responsive.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey, //muestra el scaffoldkey
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}