import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled23/enum_game/enum_game.dart';
import 'package:untitled23/enum_game/game_role.dart';
import 'package:untitled23/my_text/mytext.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
        EnumGame? UserChoise;
        EnumGame? computerChoise;
        int userScore=0;
        int cpuScore=0;
        GameRole? state;
        List choies=[EnumGame.rock,EnumGame.pepar,EnumGame.scisers];


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Color(0xff192346),
      body:
      UserChoise==null?
      Column(
mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(text: 'Rock'),
          MyText(text: 'pepar'),
          MyText(text: 'scisers'),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
           setState(() {
             UserChoise=EnumGame.rock;
           });
           makeCpuSelect();
            },
            child: Image.asset("assets/images/rock.png",
            width: 100,
            ),
          ),
          const  SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              setState(() {
                UserChoise=EnumGame.pepar;
              });
              makeCpuSelect();
            },
            child: Image.asset("assets/images/pepar.png",
              width: 100,
            ),
          ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              setState(() {
                UserChoise=EnumGame.scisers;
              });
              makeCpuSelect();
            },
            child: Image.asset("assets/images/scisers.png",
              width: 100,
            ),
          ),
          Container(
          padding:const EdgeInsets.all(20),
            child: Row(

             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    MyText(text: "User"),
                    MyText(text: '$userScore'),

                  ],
                ),
                Column(
                 children: [
                   MyText(text: "Cpu"),
                   MyText(text: "$cpuScore"),

                 ],

                ),
              ],
            ),
          ),

        ],
      ):
          Center(
            child: Container(
              margin: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  MyText(text:state!.name),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(text: 'User'),
                          SizedBox(height: 20,),
                          Image.asset('assets/images/${UserChoise!.name}.png',
                          width: 100,
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(text: 'Cpu'),
                          SizedBox(height: 20,),
                          Image.asset('assets/images/${computerChoise!.name}.png',
                          width: 100,
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                     setState(() {
                       UserChoise=null;
                     });
                    },

                    child: Container(
                      width: 250,
                      height: 80,
                      color: Colors.indigo,
                      child: Row(
mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          const Icon(Icons.replay,
                          size: 30,
                            color: Colors.white,
                          ),
                           MyText(text:'Play Again!'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


    );
  }

        makeCpuSelect(){
          Random random=Random();
          int randomNumber=random.nextInt(3);
          setState(() {
            computerChoise=choies[randomNumber];
            gameRole();
          });
        }
        gameRole(){
       if(UserChoise==EnumGame.rock&&computerChoise==EnumGame.rock)
         {
           state=GameRole.draw;
         }
       if(UserChoise==EnumGame.rock&&computerChoise==EnumGame.pepar)
       {
         state=GameRole.lose;
         cpuScore++;
       }
       if(UserChoise==EnumGame.rock&&computerChoise==EnumGame.scisers)
       {
         state=GameRole.win;
         userScore++;
       }
       if(UserChoise==EnumGame.pepar&&computerChoise==EnumGame.rock)
       {
         state=GameRole.win;
         userScore++;
       }
       if(UserChoise==EnumGame.pepar&&computerChoise==EnumGame.pepar)
       {
         state=GameRole.draw;
       }
       if(UserChoise==EnumGame.pepar&&computerChoise==EnumGame.scisers)
       {
         state=GameRole.lose;
         cpuScore++;
       }
       if(UserChoise==EnumGame.scisers&&computerChoise==EnumGame.rock)
       {
         state=GameRole.lose;
         cpuScore++;
       }
       if(UserChoise==EnumGame.scisers&&computerChoise==EnumGame.pepar)
       {
         state=GameRole.win;
         userScore++;
       }
       if(UserChoise==EnumGame.scisers&&computerChoise==EnumGame.scisers)
       {
         state=GameRole.draw;
       }


        }
}
