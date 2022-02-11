import 'package:flutter/material.dart';
import 'package:mypantry/app/components/custombutton.dart';
import 'package:mypantry/app/components/custombutton.dart';
import 'package:mypantry/app/components/customtext.dart';
import 'package:mypantry/app/screens/cadastro_screen.dart';
import 'package:mypantry/app/utils/authentication.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF),
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
                      "images/logo.png",
                      height: 250,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "bold",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 50),
                  child: CustomText(
                    controller: email,
                    hintText: "Email",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomText(
                    isObscure: true,
                    controller: pass,
                    hintText: "Senha",
                  ),
                ),
                CustomButton(
                  text: "Entrar",
                  onTap: () async {
                    await Authentication.logIn(
                        context: context,
                        email: email.text,
                        password: pass.text);
                  },
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          "Não tem uma conta? Cadastre-se",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CadastroScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
