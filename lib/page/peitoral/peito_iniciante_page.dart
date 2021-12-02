import 'package:flutter/material.dart';
import 'package:gym_app/model/custom_colors.dart';
import 'package:gym_app/model/widget_treino.dart';

class PeitoIniciantePage extends StatefulWidget {
  const PeitoIniciantePage({Key? key}) : super(key: key);

  @override
  _PeitoIniciantePageState createState() => _PeitoIniciantePageState();
}

class _PeitoIniciantePageState extends State<PeitoIniciantePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Peito Iniciante',
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
              WidgetTreino('assets/peito/iniciante/peit_ini_Flexao_joelho.png',
                  'pageFlexaoJoelho'),
              WidgetTreino(
                  'assets/peito/iniciante/peit_ini_Flexao_joelho_largura_peito.png',
                  null),
              WidgetTreino(
                  'assets/peito/iniciante/peit_ini_Flexao_joelho_diamante.png',
                  null),
            ],
          ),
        ),
      ),
    );
  }
}
