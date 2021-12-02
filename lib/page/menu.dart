import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/model/custom_colors.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Referenciar a loceção do Firestore

  var usuarios;

  @override
  void initState() {
    super.initState();

    usuarios = FirebaseFirestore.instance.collection('usuarios');
  }

  //
  //  ESPECIFICAR A APARENCIA DE CADA ELEMENTO DA LIST
  //
  showItemColecao(item) {
    String name = item.data()['name'];
    String email = item.data()['email'];

    Padding(padding: EdgeInsets.only(bottom: 15));

    return ListTile(
      title: Text(name, style: TextStyle(fontSize: 20)),
      subtitle: Text(email, style: TextStyle(fontSize: 16)),
      onTap: () {
        Navigator.pushNamed(context, 'pageEditarCadastro', arguments: item.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MENU',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, 'pageListTreino');
              },
              label: Text(
                'Meus\nTreinos',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.fitness_center_outlined,
                color: Colors.white,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 20)),
          IconButton(
            tooltip: 'Sair',
            icon: Icon(Icons.logout),
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, 'telaLogin');
            },
          ),
        ],
      ),
      backgroundColor: Colors.blue[50],
      //
      //  LISTAR OS DOCUMENTOS DA COLEÇÃO
      //

      body: StreamBuilder<QuerySnapshot>(

          //fonte de dados (coleção)
          stream: usuarios.snapshots(),

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
            Icons.mode_edit_outlined,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'pageEditarCadastro');
          }),
    );
  }
}
