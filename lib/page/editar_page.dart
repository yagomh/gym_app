import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/model/custom_colors.dart';

class EditarCadastroPage extends StatefulWidget {
  const EditarCadastroPage({Key? key}) : super(key: key);

  @override
  _EditarCadastroPageState createState() => _EditarCadastroPageState();
}

class _EditarCadastroPageState extends State<EditarCadastroPage> {
  var txtName = TextEditingController();
  var txtCPF = TextEditingController();
  var txtPhone = TextEditingController();
  var txtEmail = TextEditingController();

  //
  // RETORNAR um ÚNICO DOCUMENTO a partir do ID
  //
  getDocumentById(id) async {
    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(id)
        .get()
        .then((doc) {
      txtName.text = doc.get('name');
      txtCPF.text = doc.get('cpf');
      txtPhone.text = doc.get('phone');
      txtEmail.text = doc.get('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    // RECUPERAR o ID do Café que foi selecionado pelo usuário
    //
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (txtName.text.isEmpty &&
          txtCPF.text.isEmpty &&
          txtPhone.text.isEmpty &&
          txtEmail.text.isEmpty) {
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alterar meus dados',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomColors().getTextColorPrimary(),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors().getGradientMainColor(),
              CustomColors().getGradientSecColor(),
              CustomColors().getGradientBottomColor(),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: txtName,
                      style: TextStyle(
                        color: CustomColors().getTextColorPrimary(),
                      ),
                      decoration: InputDecoration(
                        labelText: "Nome Completo",
                        labelStyle: TextStyle(
                          color: CustomColors().getTextColorPrimary(),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: CustomColors().getTextColorPrimary(),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors().getTextColorPrimary(),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors().getTextColorPrimary(),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    TextFormField(
                      controller: txtCPF,
                      inputFormatters: [
                        // obrigatório
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      style: TextStyle(
                        color: CustomColors().getTextColorPrimary(),
                      ),
                      decoration: InputDecoration(
                        labelText: "CPF",
                        labelStyle: TextStyle(
                          color: CustomColors().getTextColorPrimary(),
                        ),
                        prefixIcon: Icon(
                          Icons.picture_in_picture_outlined,
                          color: CustomColors().getTextColorPrimary(),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors().getTextColorPrimary(),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors().getTextColorPrimary(),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    TextFormField(
                      controller: txtPhone,
                      inputFormatters: [
                        // obrigatório
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      style: TextStyle(
                        color: CustomColors().getTextColorPrimary(),
                      ),
                      decoration: InputDecoration(
                        labelText: "Telefone",
                        labelStyle: TextStyle(
                          color: CustomColors().getTextColorPrimary(),
                        ),
                        prefixIcon: Icon(
                          Icons.phone_outlined,
                          color: CustomColors().getTextColorPrimary(),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors().getTextColorPrimary(),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors().getTextColorPrimary(),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    TextFormField(
                      controller: txtEmail,
                      style: TextStyle(
                        color: CustomColors().getTextColorPrimary(),
                      ),
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: CustomColors().getTextColorPrimary(),
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: CustomColors().getTextColorPrimary(),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors().getTextColorPrimary(),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors().getTextColorPrimary(),
                          ),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      child: Text(
                        "Salvar",
                        style: TextStyle(
                            color: CustomColors().getTextColorSecondary(),
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'Salvar',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Text('Os dados estão corretos?'),
                            actions: [
                              TextButton(
                                  child: Text('Não'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              TextButton(
                                child: Text('Sim'),
                                onPressed: () {
                                  if (id == null) {
                                    //
                                    // ADICIONAR um NOVO DOCUMENTO
                                    //
                                    FirebaseFirestore.instance
                                        .collection('usuarios')
                                        .add({
                                      'name': txtName.text,
                                      'cpf': txtCPF.text,
                                      'phone': txtPhone.text,
                                      'email': txtEmail.text,
                                    });
                                  } else {
                                    //
                                    // ATUALIZAR UM DOCUMENTO EXISTENTE
                                    //
                                    FirebaseFirestore.instance
                                        .collection('usuarios')
                                        .doc(id.toString())
                                        .set({
                                      'name': txtName.text,
                                      'cpf': txtCPF.text,
                                      'phone': txtPhone.text,
                                      'email': txtEmail.text,
                                    });
                                  }

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Alteração feita com sucesso !'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );

                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      child: Text(
                        "Cancelar",
                        style: TextStyle(
                            color: CustomColors().getTextColorSecondary(),
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}
