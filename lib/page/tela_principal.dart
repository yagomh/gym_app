import 'package:flutter/material.dart';
import 'package:gym_app/page/home.dart';
import 'package:gym_app/page/menu.dart';
import 'package:gym_app/page/sobre.dart';
import 'package:gym_app/model/custom_colors.dart';

//
//  TELA PRINCIPAL
//

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  // Índice da página que será carregada inicialmente
  var telaAtual = 1;

  // Controlador utilizado para troca das telas (páginas)
  var pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      //  BODY
      //

      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        children: [
          MenuScreen(), //  curremtIndex = 0
          HomeScreen(), //  curremtIndex = 1
          SobreScreen(), //  curremtIndex = 2
        ],
      ),

      //
      // BARRA DE NAVEGAÇÃO
      //

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors().getGradientBottomColor(),
        selectedItemColor: CustomColors().getTextColorPrimary(),

        unselectedItemColor:
            CustomColors().getTextColorPrimary().withOpacity(.40),
        selectedFontSize: 16,
        unselectedFontSize: 16,
        iconSize: 40,

        // Index do botão Selecionado
        currentIndex: telaAtual,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Sobre',
          ),
        ],

        // Mudança de Tela (Página)
        onTap: (index) {
          setState(() {
            telaAtual = index;
          });
          pageController.animateToPage(
            index,
            duration: Duration(
              milliseconds: 200,
            ),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }
}
