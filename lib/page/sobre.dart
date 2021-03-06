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
                  'Esportivo e Sa??de',
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
                  'O app tem como objetivo, ajudar as pessoas a fazerem atividade f??sica em casa, sem necessidade de aparelhos.\n\n'
                  '   A import??ncia da atividade f??sica na promo????o da sa??de\n\n'
                  'As atividades f??sicas geram uma grande quantidade de benef??cios para o nosso corpo e tamb??m para nossa mente. ?? por isso que a pr??tica dessas atividades ?? t??o recomendada por todos os profissionais de sa??de. A seguir, listaremos alguns dos benef??cios j?? reconhecidos a respeito da import??ncia das atividades f??sicas:\n\n'
                  '??? A atividade f??sica previne o desenvolvimento de doen??as cr??nicas, como hipertens??o e diabetes.\n'
                  '??? As atividades f??sicas controlam os n??veis de colesterol.\n'
                  '??? A atividade f??sica pode ser uma importante aliada no tratamento da depress??o e ansiedade.\n'
                  '??? A atividade f??sica melhora o condicionamento muscular e tamb??m cardiorrespirat??rio.\n'
                  '??? A atividade f??sica provoca uma s??rie de mudan??as no organismo, tais como o ganho de massa muscular, que est?? diretamente relacionado com a melhora da autoestima.\n'
                  '??? A atividade f??sica ?? importante para o controle de peso.\n'
                  '??? Atividade f??sica melhora dores e diminui a incapacidade funcional.\n'
                  '??? A pr??tica de atividades f??sicas melhora a qualidade do sono.\n'
                  '??? As atividades f??sicas melhoram o desempenho cognitivo.\n'
                  '??? A pr??tica de atividades f??sicas reduz o estresse e aumenta a sensa????o de bem-estar.\n'
                  '??? A atividade f??sica ?? importante no processo de envelhecimento, uma vez que um idoso ativo apresenta mais autonomia para realizar as atividades do seu dia a dia. Al??m disso, idosos que praticam atividades f??sicas apresentam menos riscos de sofrerem quedas, as quais podem ser graves em certas idades.\n'
                  '??? A atividade pode melhorar o conv??vio social.\n'
                  '??? A atividade f??sica d?? mais disposi????o para a realiza????o das atividades di??rias.',
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
