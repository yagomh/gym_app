import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/model/custom_colors.dart';

class ListTreinoPage extends StatefulWidget {
  const ListTreinoPage({Key? key}) : super(key: key);

  @override
  _ListTreinoPageState createState() => _ListTreinoPageState();
}

class _ListTreinoPageState extends State<ListTreinoPage> {
  // Referenciar a loceção do Firestore
  var treinos;

  @override
  void initState() {
    super.initState();

    treinos = FirebaseFirestore.instance.collection('treinos');
  }

  //
  //  ESPECIFICAR A APARENCIA DE CADA ELEMENTO DA LIST
  //
  showItemColecao(item) {
    String treino = item.data()['treino'];
    String descricao = item.data()['descricao'];

    return ListTile(
      title: Text(treino, style: TextStyle(fontSize: 20)),
      subtitle: Text(descricao, style: TextStyle(fontSize: 16)),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          //
          //   APAGAR UM DOCUMENTO
          //
          treinos.doc(item.id).delete();
        },
      ),
      onTap: () {
        Navigator.pushNamed(context, 'pageListAddTreino', arguments: item.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Minha lista de treino',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[50],

      //
      //  LISTAR OS DOCUMENTOS DA COLEÇÃO
      //

      body: StreamBuilder<QuerySnapshot>(
          //fonte de dados (coleção)
          stream: treinos.snapshots(),

          //exibir os dados retornados
          builder: (contex, snapshot) {
            //verifica o estado da conexão
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                    child: Text('Não foi possível conectar ao Firestore'));

              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());

              //se os dados forem recebidos com sucesso
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (contex, index) {
                      return showItemColecao(dados.docs[index]);
                    });
            }
          }),

      floatingActionButton: FloatingActionButton(
          foregroundColor: CustomColors().getTextColorPrimary(),
          backgroundColor: CustomColors().getGradientSecColor(),
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'pageListAddTreino');
          }),
    );
  }
}
