import 'package:flutter/material.dart';
import 'package:mypantry/app/components/custombutton.dart';
import 'package:mypantry/app/components/customtext.dart';
import 'package:mypantry/app/utils/database.dart';

class AdicionarScreen extends StatelessWidget {
  AdicionarScreen({Key? key}) : super(key: key);
  final TextEditingController nome = TextEditingController();
  final TextEditingController ingrediente = TextEditingController();
  final TextEditingController quantidade = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  padding: EdgeInsets.only(top: 50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFF8F8F6),
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30, top: 15),
                  child: Text(
                    "Adicionar receita",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "semi-bold",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: CustomText(
                    backgroundColor: Color(0xFFF8F8F6),
                    title: "Nome da receita:",
                    controller: nome,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CustomText(
                      icon: "Ingrediente",
                      hintText: "Digite o nome do ingrediente",
                      backgroundColor: Color(0xFFF8F8F6),
                      controller: quantidade,
                      title: "Ingrediente:",
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomButton(
                    text: "Finalizar",
                    onTap: () async {
                      bool result = await addReceita(
                        context: context,
                        nome: nome.text,
                        ingrediente: ingrediente.text,
                        quantidade: quantidade.text,
                      );

                      if (result) {
                        Navigator.pop(context);
                      }
                    },
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
