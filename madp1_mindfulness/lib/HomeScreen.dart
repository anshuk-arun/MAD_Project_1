import 'package:flutter/material.dart';
import 'package:madp1_mindfulness/CalendarScreen.dart';
import 'package:madp1_mindfulness/MindfulnessScreen.dart';
import 'package:madp1_mindfulness/StressReduceScreen.dart';

void main(){}


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    // Navigate to Mindfulness when clicked
    void openMindfulnessScreen(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MindfulnessScreen())
      ); 
    }

    // Navigate to Stress Reduction when clicked
    void openStressReduceScreen(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StressReduceScreen())
      ); 
    }

    // Navigate to Calendar when clicked
    void openCalendarScreen(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CalendarScreen())
      ); 
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen Mindfulness'),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(){
                      openMindfulnessScreen();
                    };
                  },
                  child: const Text('Mindfulness Screen'),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(){
                      openStressReduceScreen();
                    };
                  },
                  child: const Text('Stress Reduction Screen'),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: (){
                setState(){
                  openCalendarScreen();
                };
              },
              child: const Text('Calendar Screen'),
            ),
            FloatingActionButton(
              onPressed: (){
                Navigator.of(context).pop();
                //Navigator.pop(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              child: const Text('Back to Entry'),
            ),

          ]
        ),
      ),

    );
  }

}