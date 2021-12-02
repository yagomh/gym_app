import 'package:flutter/material.dart';
import 'package:gym_app/model/custom_colors.dart';

class PeitoDifficultyModality extends StatefulWidget {
  const PeitoDifficultyModality({Key? key}) : super(key: key);

  @override
  _PeitoDifficultyModalityState createState() =>
      _PeitoDifficultyModalityState();
}

class _PeitoDifficultyModalityState extends State<PeitoDifficultyModality> {
  //Lista dinâmica para armazenamento das tarefas
  var lista = [];

  @override
  void initState() {
    lista.add('PEITO INICIANTE');
    lista.add('PEITO INTERMEDIÁRIO');
    lista.add('PEITO AVANÇADO');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Escolha o nivel da modalidade',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
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

        //
        //ListView
        //
        child: ListView.builder(
          itemCount: lista.length,

          //definir a aparência dos elementos

          itemBuilder: (context, index) {
            return Center(
              child: Container(
                width: 300,
                margin: EdgeInsets.only(bottom: 60),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, lista[index]);
                  },
                  child: Text(
                    lista[index],
                    style: TextStyle(
                      color: CustomColors().getTextColorPrimary(),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    primary: CustomColors().getActivePrimaryButtonColor(),
                    shadowColor: Colors.black,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
