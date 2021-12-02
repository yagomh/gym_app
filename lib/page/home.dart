import 'package:flutter/material.dart';
import 'package:gym_app/model/custom_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 100, 15, 0),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                          ),
                        ),
                        child: IconButton(
                          icon: Image.asset(
                            "assets/peitoral.png",
                          ),
                          iconSize: 130,
                          onPressed: () {
                            Navigator.pushNamed(context, 'telaPeitoDifficulty');
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 3)),
                      Text(
                        'PEITO',
                        style: TextStyle(
                          color: CustomColors().getTextColorPrimary(),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                          ),
                        ),
                        child: IconButton(
                          icon: Image.asset(
                            "assets/abdome.png",
                          ),
                          iconSize: 130,
                          onPressed: () {
                            print('Funcionou');
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 3)),
                      Text(
                        'ABDOME',
                        style: TextStyle(
                          color: CustomColors().getTextColorPrimary(),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                          ),
                        ),
                        child: IconButton(
                          icon: Image.asset(
                            "assets/gluteos.png",
                          ),
                          iconSize: 130,
                          onPressed: () {
                            print('Funcionou');
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 3)),
                      Text(
                        'GLÚTEOS',
                        style: TextStyle(
                          color: CustomColors().getTextColorPrimary(),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                          ),
                        ),
                        child: IconButton(
                          icon: Image.asset(
                            "assets/pernas.png",
                          ),
                          iconSize: 130,
                          onPressed: () {
                            print('Funcionou');
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 3)),
                      Text(
                        'PERNAS',
                        style: TextStyle(
                          color: CustomColors().getTextColorPrimary(),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
