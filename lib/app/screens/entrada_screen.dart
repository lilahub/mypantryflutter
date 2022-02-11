import 'package:flutter/material.dart';
import 'package:mypantry/app/components/custombutton.dart';
import 'package:mypantry/app/screens/login_screen.dart';

class EntradaScreen extends StatelessWidget {
  EntradaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffff),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50, top: 50),
                  child: Center(
                    child: Image.asset(
                      "images/sacola.png",
                      height: 250,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Organize sua despensa aqui",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "bold",
                    ),
                  ),
                ),
                CustomButton(
                  text: "Começar",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
