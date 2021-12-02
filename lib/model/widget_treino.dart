import 'package:flutter/material.dart';

class WidgetTreino extends StatelessWidget {
//Atributos que serão utilizados para receber informações
  final foto;
  final page;

//Construtor
//O primeiro método que é executado quando o objeto
// da classe é instanciado.
  const WidgetTreino(this.foto, this.page, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.blueGrey[100],
      ),
      width: 300,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, this.page);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                ),
              ),
              child: Image.asset(
                this.foto,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
