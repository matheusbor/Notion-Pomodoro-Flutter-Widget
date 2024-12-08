import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_widget/widgets/config_navigation.dart';
import 'package:pomodoro_widget/widgets/config_timers.dart';

class ConfigWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 284,//sei que a tela de pomodoro não passa de 284 mesmo podendo
          maxWidth: 450,
          minHeight: 284,
          minWidth: 287
    ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 32),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.white),
            ),
            child:LayoutBuilder(
                builder: (context, constraints){

                  return SizedBox(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: Row(
                      children: [
                        ConfigNavigation(),
                        SizedBox(width: 4,),
                        VerticalDivider(width: 1,),
                        SizedBox(width: 16,),
                        Expanded(
                            child: ConfigTimers()),


                      ],
                    ),
                  );
                }),
          ),
          Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close,
                  color: Colors.white ,))),
        ]

      ),

    );
  }

}