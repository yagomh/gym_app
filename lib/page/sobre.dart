import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gym_app/model/custom_colors.dart';

class SobreScreen extends StatelessWidget {
  const SobreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
            children: [
              Text(
                'SOBRE',
                style: TextStyle(
                  color: CustomColors().getTextColorPrimary(),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/desenvolvidor.jpg",
                        scale: 3.5,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 15)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Desenvolvidor',
                        style: TextStyle(
                          color: CustomColors().getTextColorPrimary(),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 5)),
                      Text(
                        'Yago Mestrinel Hoeppner',
                        style: TextStyle(
                          color: CustomColors().getTextColorPrimary(),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Esportivo e Saúde',
                  style: TextStyle(
                    color: CustomColors().getTextColorPrimary(),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'O app tem como objetivo, ajudar as pessoas a fazerem atividade física em casa, sem necessidade de aparelhos.\n\n'
                  '   A importância da atividade física na promoção da saúde\n\n'
                  'As atividades físicas geram uma grande quantidade de benefícios para o nosso corpo e também para nossa mente. É por isso que a prática dessas atividades é tão recomendada por todos os profissionais de saúde. A seguir, listaremos alguns dos benefícios já reconhecidos a respeito da importância das atividades físicas:\n\n'
                  '• A atividade física previne o desenvolvimento de doenças crônicas, como hipertensão e diabetes.\n'
                  '• As atividades físicas controlam os níveis de colesterol.\n'
                  '• A atividade física pode ser uma importante aliada no tratamento da depressão e ansiedade.\n'
                  '• A atividade física melhora o condicionamento muscular e também cardiorrespiratório.\n'
                  '• A atividade física provoca uma série de mudanças no organismo, tais como o ganho de massa muscular, que está diretamente relacionado com a melhora da autoestima.\n'
                  '• A atividade física é importante para o controle de peso.\n'
                  '• Atividade física melhora dores e diminui a incapacidade funcional.\n'
                  '• A prática de atividades físicas melhora a qualidade do sono.\n'
                  '• As atividades físicas melhoram o desempenho cognitivo.\n'
                  '• A prática de atividades físicas reduz o estresse e aumenta a sensação de bem-estar.\n'
                  '• A atividade física é importante no processo de envelhecimento, uma vez que um idoso ativo apresenta mais autonomia para realizar as atividades do seu dia a dia. Além disso, idosos que praticam atividades físicas apresentam menos riscos de sofrerem quedas, as quais podem ser graves em certas idades.\n'
                  '• A atividade pode melhorar o convívio social.\n'
                  '• A atividade física dá mais disposição para a realização das atividades diárias.',
                  style: TextStyle(
                    color: CustomColors().getTextColorPrimary(),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
