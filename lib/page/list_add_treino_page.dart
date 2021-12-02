import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListAddTreinoPage extends StatefulWidget {
  const ListAddTreinoPage({Key? key}) : super(key: key);

  @override
  _ListAddTreinoPageState createState() => _ListAddTreinoPageState();
}

class _ListAddTreinoPageState extends State<ListAddTreinoPage> {
  var txtTreino = TextEditingController();
  var txtDescricao = TextEditingController();

  //
  // RETORNAR um ÚNICO DOCUMENTO a partir do ID
  //
  getDocumentById(id) async {
    await FirebaseFirestore.instance
        .collection('treinos')
        .doc(id)
        .get()
        .then((doc) {
      txtTreino.text = doc.get('treino');
      txtDescricao.text = doc.get('descricao');
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    // RECUPERAR o ID do Café que foi selecionado pelo usuário
    //
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtTreino.text.isEmpty && txtDescricao.text.isEmpty) {
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Treinos'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.blue[50],
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(children: [
          TextField(
            controller: txtTreino,
            style: TextStyle(color: Colors.black, fontSize: 26),
            decoration: InputDecoration(
              labelText: 'Exercício',
              labelStyle: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
          SizedBox(height: 30),
          TextField(
            controller: txtDescricao,
            style: TextStyle(color: Colors.black, fontSize: 26),
            decoration: InputDecoration(
              labelText: 'Descrição',
              labelStyle: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  child: Text(
                    "Salvar",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    if (id == null) {
                      //
                      // ADICIONAR um NOVO DOCUMENTO
                      //
                      FirebaseFirestore.instance.collection('treinos').add({
                        'treino': txtTreino.text,
                        'descricao': txtDescricao.text,
                      });
                    } else {
                      //
                      // ATUALIZAR UM DOCUMENTO EXISTENTE
                      //
                      FirebaseFirestore.instance
                          .collection('treinos')
                          .doc(id.toString())
                          .set({
                        'treino': txtTreino.text,
                        'descricao': txtDescricao.text,
                      });
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Treino salvo!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
