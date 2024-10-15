import 'package:flutter/material.dart';

void main(){}


class MindfulnessScreen extends StatelessWidget{

  MindfulnessScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mindfulness'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Mindfulness'),
          FloatingActionButton(
            onPressed: (){
              Navigator.of(context).pop();
              //Navigator.pop(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: const Text('Back to Home/Affirmations'),
          ),

        ]
      ),
      
    );
  }

}