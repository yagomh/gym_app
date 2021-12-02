import 'package:flutter/material.dart';
import 'package:gym_app/model/custom_colors.dart';
import 'package:gym_app/model/widget_treino.dart';

class PeitoAvancadoPage extends StatefulWidget {
  const PeitoAvancadoPage({Key? key}) : super(key: key);

  @override
  _PeitoAvancadoPageState createState() => _PeitoAvancadoPageState();
}

class _PeitoAvancadoPageState extends State<PeitoAvancadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Peito Avançado',
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
                  'assets/peito/avancado/peit_avanc_Flexao_explosivas.png',
                  null),
              WidgetTreino(
                  'assets/peito/avancado/peit_avanc_Flexao_rotacao_tronco.png',
                  null),
              WidgetTreino(
                  'assets/peito/avancado/peit_avanc_Spartan_push.png', null),
              WidgetTreino(
                  'assets/peito/avancado/peit_avanc_Flexao_homem_aranha.png',
                  null),
              WidgetTreino(
                  'assets/peito/avancado/peit_avanc_Jump_burpees.png', null),
            ],
          ),
        ),
      ),
    );
  }
}
