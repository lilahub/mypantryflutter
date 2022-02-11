import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mypantry/app/components/custombutton.dart';
import 'package:mypantry/app/components/customtext.dart';
import 'package:mypantry/app/utils/messages.dart';

class EditarScreen extends StatelessWidget {
  late TextEditingController nome = TextEditingController();
  late TextEditingController ingrediente = TextEditingController();
  late TextEditingController quantidade = TextEditingController();
  QueryDocumentSnapshot<Object?> rec;
  EditarScreen({
    Key? key,
    required this.rec,
  }) : super(key: key) {
    nome = TextEditingController(text: "${rec["nome"]}");
    ingrediente = TextEditingController(text: "${rec["ingrediente"]}");
    quantidade = TextEditingController(text: "${rec["quantidade"]}");
    
  }

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
                    "Editar receita",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "bold",
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CustomText(
                            backgroundColor: Color(0xFFF8F8F6),
                            controller: ingrediente,
                            title: "Ingrediente:",
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomText(                          
                          backgroundColor: Color(0xFFF8F8F6),
                          controller: quantidade,
                          title: "Quantidade:",
                        ),
                      ),
                    ],
                  ),//////
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: CustomButton(
                    backgroundColor: Color(0xFFD11B1B),
                    text: "Excluir",
                    onTap: () async {
                      try {
                        await rec.reference.delete();
                        Navigator.of(context).pop();
                      } catch (e) {
                        Message.showError(context, "Não foi possivel excluir");
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomButton(
                    text: "Salvar alterações",
                    onTap: () async {
                      try {
                        await rec.reference.update({
                          "nome": nome.text,
                          "ingrediente": ingrediente.text,
                          "quantidade": quantidade.text,
                          "email": FirebaseAuth.instance.currentUser!.email,
                          
                        });
                        Navigator.of(context).pop();
                      } catch (e) {
                        Message.showError(
                            context, "Não foi possivel salvar as alterações");
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
