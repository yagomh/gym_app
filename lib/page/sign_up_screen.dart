import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/model/custom_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var txtName = TextEditingController();
  var txtCPF = TextEditingController();
  var txtPhone = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  var txtPasswordConfirm = TextEditingController();

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomColors().getTextColorPrimary(),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                    TextFormField(
                      controller: txtPassword,
                      obscureText: (this.showPassword == true) ? false : true,
                      style: TextStyle(
                        color: CustomColors().getTextColorPrimary(),
                      ),
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: CustomColors().getTextColorPrimary(),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
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
                    /* (this.showPassword == false)
                        ? TextFormField(
                            controller: txtPasswordConfirm,
                            obscureText: true,
                            style: TextStyle(
                              color: CustomColors().getTextColorPrimary(),
                            ),
                            decoration: InputDecoration(
                              labelText: "Confirmar a Senha",
                              labelStyle: TextStyle(
                                color: CustomColors().getTextColorPrimary(),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
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
                          )
                        : Container(), */
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      children: [
                        Checkbox(
                          value: this.showPassword,
                          onChanged: (bool? newValue) {
                            setState(() {
                              this.showPassword = newValue!;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                        Text(
                          "Mostrar Senha",
                          style: TextStyle(
                            color: CustomColors().getTextColorPrimary(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Cadastrar conta',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: Text('Os dados estão corretos?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context, null);
                              },
                              child: Text('Não')),
                          TextButton(
                              onPressed: () {
                                createAccount(
                                  txtName.text,
                                  txtCPF.text,
                                  txtPhone.text,
                                  txtEmail.text,
                                  txtPassword.text,
                                );
                                Navigator.pop(context, null);
                              },
                              child: Text('Sim')),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                        color: CustomColors().getTextColorSecondary(),
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors().getActiveSecondaryButton(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
  //  CRIAR CONTA - no Firebase Auth
  //

  void createAccount(name, cpf, phone, email, password) {
    // CRIA CONTA \/
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      showMessenger('Usuário criado com sucesso!');

      //
      //  ADICIONAR UM NOVO DOCUMENTO - BANCO DE DADOS FIRESTORE
      //    \/
      FirebaseFirestore.instance.collection('usuarios').add({
        'name': name,
        'cpf': cpf,
        'phone': phone,
        'email': email,
        'password': password,
      });

      Navigator.pop(context);

      // MOSTRA ERROS \/
    }).catchError((erro) {
      if (erro.code == 'email-already-in-use') {
        showMessenger('ERRO: O email informado está em uso.');
      } else if (erro.code == 'invalid-email') {
        showMessenger('ERRO: Email inválido.');
      } else {
        showMessenger('ERRO: ${erro.message}');
      }
    });
  }

  void showMessenger(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
