import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/model/custom_colors.dart';
import 'package:video_player/video_player.dart';

class PeitoIniFlexaoJoelho extends StatefulWidget {
  const PeitoIniFlexaoJoelho({Key? key}) : super(key: key);

  @override
  _PeitoIniFlexaoJoelhoState createState() => _PeitoIniFlexaoJoelhoState();
}

class _PeitoIniFlexaoJoelhoState extends State<PeitoIniFlexaoJoelho> {
// inicializando video player
  final VideoPlayerController videoPlayerController =
      VideoPlayerController.asset(
    'assets/peito/iniciante/video/loop_peit_ini_Flexao_joelho.mp4',
  );

  ChewieController? chewieController;

  // initState
  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: true,
      autoPlay: true,
      showControls: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flexões de Joelho',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 300,
                  child: Chewie(
                    controller: chewieController!,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                'Descrição',
                style: TextStyle(
                  color: CustomColors().getTextColorSecondary(),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Flexões de joelho envolvem os músculos do peito, bem como '
                'os tríceps, costas e ombros. Comparado às flexões '
                'regulares, este exercício é mais adequado para iniciantes.',
                style: TextStyle(
                  color: CustomColors().getTextColorSecondary(),
                  fontSize: 14,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                'Instruções',
                style: TextStyle(
                  color: CustomColors().getTextColorSecondary(),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '1 - Deite-se de bruços no chão. Mantenha os joelhos '
                'dobrados e cruze os tornozelos. Suas mãos devem ser ligeiramente '
                'maiores que a largura dos ombros. Olhe para a frente.\n'
                '2 - Abaixe seu corpo lentamente enquanto contrai os músculos '
                'do peito. Mantenha uma coluna neutra.\n'
                '3 - Levante-se e repita.',
                style: TextStyle(
                  color: CustomColors().getTextColorSecondary(),
                  fontSize: 14,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: [
                  Text(
                    'Dificuldade: ',
                    style: TextStyle(
                      color: CustomColors().getTextColorSecondary(),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Iniciante',
                    style: TextStyle(
                      color: CustomColors().getTextColorSecondary(),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Tipo: ',
                    style: TextStyle(
                      color: CustomColors().getTextColorSecondary(),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Força',
                    style: TextStyle(
                      color: CustomColors().getTextColorSecondary(),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Equipamentos: ',
                    style: TextStyle(
                      color: CustomColors().getTextColorSecondary(),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Nenhum',
                    style: TextStyle(
                      color: CustomColors().getTextColorSecondary(),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                'Erros comuns',
                style: TextStyle(
                  color: CustomColors().getTextColorSecondary(),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '• Mantenha a mandíbula e o queixo muito perto do peito\n'
                '• Arquear a parte inferior das costas',
                style: TextStyle(
                  color: CustomColors().getTextColorSecondary(),
                  fontSize: 14,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                'Músculos envolvidos',
                style: TextStyle(
                  color: CustomColors().getTextColorSecondary(),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '• Peitorais\n'
                '• Tríceps',
                style: TextStyle(
                  color: CustomColors().getTextColorSecondary(),
                  fontSize: 14,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Center(
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                      'assets/corpo_frente_costa_peit_tric.png',
                      width: 350,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
