import 'dart:developer';
import 'dart:typed_data';
import 'package:mypantry/app/utils/messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

void saveUser({
  required String name,
  required String email,
}) async {
  DocumentReference userDB =
      FirebaseFirestore.instance.collection('Users').doc(email);

  await userDB.get().then((DocumentSnapshot doc) async {
    if (doc.exists) {
      return await userDB.update({
        'name': name,
        'email': email,
      });
    } else {
      return await userDB.set({
        'name': name,
        'email': email,
      });
    }
  });
}

Future<bool> addReceita({
  required BuildContext context,
  required String nome,
  required String ingrediente,
  required String quantidade,
}) async {
  try {
    CollectionReference receitaDB =
        FirebaseFirestore.instance.collection('Receita');

    await receitaDB.add(
      {
        "nome": nome,
        "ingrediente": ingrediente,
        "quantidade": quantidade,
      },
    );

    return true;
  } catch (e) {
    Message.showError(context, 'Erro ao adicionar');
    return false;
  }
}

Future<DocumentSnapshot?> getUser([String? email]) async {
  DocumentReference userDB = FirebaseFirestore.instance
      .collection('Users')
      .doc(email ?? FirebaseAuth.instance.currentUser!.email);

  DocumentSnapshot userDoc = await userDB.get();
  if (userDoc.exists) {
    return userDoc;
  }
}

Future<List<QueryDocumentSnapshot>> getReceita() async {
  CollectionReference lembreteDB =
      FirebaseFirestore.instance.collection('Receita');
  var list = await lembreteDB
      .where(
        "email",
        isEqualTo: FirebaseAuth.instance.currentUser!.email,
      )
      .get();
  return list.docs.toList();
}

Future<List<QueryDocumentSnapshot>> getMeusLivros() async {
  CollectionReference bibliDB =
      FirebaseFirestore.instance.collection('Receita');
  var list = await bibliDB
      .where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email)
      .get();
  return list.docs.toList();
}

Future<bool> removerLivro(String id) async {
  CollectionReference bibliDB =
      FirebaseFirestore.instance.collection('Receita');
  try {
    var ref = await bibliDB.doc("$id");
    ref.delete();
    return true;
  } catch (e) {
    return false;
  }
}
