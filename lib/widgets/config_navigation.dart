import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfigNavigation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onPressed: (){},
            child: Text("Timers",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 24,),
        TextButton(
            onPressed: (){},
            child: Text("Sounds",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 24,),
        TextButton(
            onPressed: (){},
            child: Text("Preferences",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),

      ],
    );
  }
  
}