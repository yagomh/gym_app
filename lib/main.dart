import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/page/editar_page.dart';
import 'package:gym_app/page/home.dart';
import 'package:gym_app/page/list_add_treino_page.dart';
import 'package:gym_app/page/list_treino_page.dart';
import 'package:gym_app/page/peitoral/iniciante/flexao_joelho.dart';
import 'package:gym_app/page/peitoral/peito_avancado_page.dart';
import 'package:gym_app/page/peitoral/peito_difficulty_modality.dart';
import 'package:gym_app/page/login_screen.dart';
import 'package:gym_app/page/menu.dart';
import 'package:gym_app/page/peitoral/peito_iniciante_page.dart';
import 'package:gym_app/page/peitoral/peito_intermediario_page.dart';
import 'package:gym_app/page/sign_up_screen.dart';
import 'package:gym_app/page/sobre.dart';
import 'package:gym_app/page/tela_principal.dart';

Future<void> main() async {
  //
  //  INICIALIZAR OS Plugins
  //
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      title: 'GYM app',
      initialRoute: 'telaLogin',
      routes: {
        'telaHome': (context) => HomeScreen(),
        'telaSignUp': (context) => SignUpScreen(),
        'telaLogin': (context) => LoginScreen(),
        'telaMenu': (context) => MenuScreen(),
        'telaSobre': (context) => SobreScreen(),
        'telaPrincipal': (context) => TelaPrincipal(),
        'telaPeitoDifficulty': (context) => PeitoDifficultyModality(),
        'PEITO INICIANTE': (context) => PeitoIniciantePage(),
        'PEITO INTERMEDIÁRIO': (context) => PeitoIntermediarioPage(),
        'PEITO AVANÇADO': (context) => PeitoAvancadoPage(),
        'pageFlexaoJoelho': (context) => PeitoIniFlexaoJoelho(),
        'pageListTreino': (context) => ListTreinoPage(),
        'pageListAddTreino': (context) => ListAddTreinoPage(),
        'pageEditarCadastro': (context) => EditarCadastroPage(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
