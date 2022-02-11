import 'package:flutter/material.dart';
import 'package:mypantry/app/screens/adicionar_screen.dart';
import 'package:mypantry/app/screens/entrada_screen.dart';
import 'package:mypantry/app/screens/inicio_screen.dart';
import 'package:mypantry/app/screens/login_screen.dart';
import 'package:mypantry/app/screens/cadastro_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "bold",
      ),
      debugShowCheckedModeBanner: false,
      home: EntradaScreen(),
    );
  }
}
