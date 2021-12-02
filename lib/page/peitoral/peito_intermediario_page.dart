import 'package:flutter/material.dart';
import 'package:gym_app/model/custom_colors.dart';
import 'package:gym_app/model/widget_treino.dart';

class PeitoIntermediarioPage extends StatefulWidget {
  const PeitoIntermediarioPage({Key? key}) : super(key: key);

  @override
  _PeitoIntermediarioPageState createState() => _PeitoIntermediarioPageState();
}

class _PeitoIntermediarioPageState extends State<PeitoIntermediarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Peito Intermediário',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
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
          child: Column(
            children: [
              WidgetTreino(
                  'assets/peito/intermediario/peit_int_Flexao.png', null),
              WidgetTreino(
                  'assets/peito/intermediario/peit_int_Flexao_largura_peito.png',
                  null),
              WidgetTreino(
                  'assets/peito/intermediario/peit_int_Flexao_hindu.png', null),
              WidgetTreino(
                  'assets/peito/intermediario/peit_int_Flexao_atlas.png', null),
            ],
          ),
        ),
      ),
    );
  }
}
