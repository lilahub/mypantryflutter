import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mypantry/app/components/custombutton.dart';
import 'package:mypantry/app/screens/adicionar_screen.dart';
import 'package:mypantry/app/screens/editar_screen.dart';
import 'package:mypantry/app/utils/database.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Olá, comece a se organizar!",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "regular",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Gerencie suas receitas",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                      future: getReceita(),
                      builder: (context,
                          AsyncSnapshot<List<QueryDocumentSnapshot>> docs) {
                        if (docs.hasData && docs.data!.length > 0) {
                          return ListView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              ...docs.data!.map(
                                (rec) => GestureDetector(
                                  onTap: () async {
                                    await Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditarScreen(rec: rec),
                                      ),
                                    );
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    alignment: Alignment.centerLeft,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xFFF8F8F6),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Text(
                                                  "${rec["nome"]}",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                        Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Image.asset(
                                            "images/vector.png",
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ), ///////////////
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return Column(
                          children: [Text("Nenhuma receita registrada")],
                        );
                      }),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AdicionarScreen(),
                          ),
                        );
                        setState(() {});
                      },
                      child: Center(
                        child: Center(
                          child: CustomButton(
                            text: "Adicionar receita",
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AdicionarScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
