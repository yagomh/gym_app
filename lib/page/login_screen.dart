import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/model/custom_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  bool isLoading = false;

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Padding(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                child: Image.asset(
                  "assets/logoHalteres.png",
                  height: 150,
                ),
              ),
              Text(
                'Entrar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CustomColors().getTextColorPrimary(),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      controller: txtEmail,
                      style: TextStyle(color: Colors.white),
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
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    TextFormField(
                      obscureText: (this.showPassword == true) ? false : true,
                      controller: txtPassword,
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
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors().getTextColorPrimary(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              GestureDetector(
                onTap: () {
                  print("FUNCIONOU!");
                },
                child: Text(
                  "Esqueceu a senha?",
                  style: TextStyle(
                    color: CustomColors().getTextColorPrimary(),
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
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
                    "Mostrar senha",
                    style: TextStyle(
                      color: CustomColors().getTextColorPrimary(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: ElevatedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: CustomColors().getTextColorPrimary(),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors().getActivePrimaryButtonColor(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    login(txtEmail.text, txtPassword.text);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Text(
                "Ainda não possui uma conta?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11.5),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'telaSignUp');
                  },
                  child: Text("Cadastre-se",
                      style: TextStyle(
                        color: CustomColors().getTextColorSecondary(),
                      )),
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
  //  LOGIN com Firebase Auth
  //
  void login(email, password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pushReplacementNamed(context, 'telaPrincipal');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.lightBlue,
          content: Text('Login efetuado com sucesso!'),
          duration: Duration(seconds: 2),
        ),
      );
    }).catchError((erro) {
      if (erro.code == 'user-not-found') {
        showMessenger("ERRO: Usuário não encontrado.");
      } else if (erro.code == 'wrong-password') {
        showMessenger('ERRO: Senha inconrreta.');
      } else if (erro.code == 'invalid-email') {
        showMessenger('ERRO: E-mail inválido.');
      } else {
        showMessenger('ERRO: ${erro.message}.');
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
