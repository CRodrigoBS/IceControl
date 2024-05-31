
//esto es lo que se ejecuta primero . siempre lo ara , lo que manda es el void main()
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // uso de fuentes para la aplicaicon 
import 'package:ice_control/constants.dart';// importa los colores 
import 'package:ice_control/controllers/menu_app_controller.dart';//Importa el controlador para la gestión del menú de la aplicación.
import 'package:ice_control/pages/main_screen.dart';//importa pages main_screem
import 'package:provider/provider.dart';//

void main() {
  runApp(const MyApp());  //ejecuta la calse MYAPP 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard__prueba',

      //General todo 
      theme:ThemeData.dark().copyWith(
        scaffoldBackgroundColor: prueba,//bgColor
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),


      //contenido de la aplicacion
      home: MultiProvider( //con multiprovider uso de multiples proveedores 
        providers: [  //lista de proveedores solo hay una 

          ChangeNotifierProvider(
            create: (context) => MenuAppController(),  // llama al archivo MenuAppController()
          ),
          
        ],
        child: const MainScreen(), //llama al archivo MainScreen
        ),


    );

  }
}
