import 'dart:math';

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
  int currentPageIndex = 0;
  
  List<String> affirmations = <String>[
    "I am worthy of love, happiness, and success.",
    "I am enough just as I am.",
    "My potential is limitless, and I strive for greatness.",
    "My well-being is a reflection of the love and care I invest in myself.",
    "I am deserving of deep, meaningful, and fulfilling connections.",
    "My life is enriched by the beautiful connections I cultivate.",
    "Challenges are opportunities for growth and learning.",
  ];
  String dailyAffirmation = "";

  void generateDailyAffirmation(){
    setState(() {
      dailyAffirmation = affirmations.elementAt(Random().nextInt(affirmations.length));

    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // Daily Affirmation
    generateDailyAffirmation();

    // Currently not in use, but it may be needed later, depending.
    // // Navigate to Mindfulness when clicked
    // void openMindfulnessScreen(){
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => MindfulnessScreen())
    //   ); 
    // }
    // // Navigate to Stress Reduction when clicked
    // void openStressReduceScreen(){
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => StressReduceScreen())
    //   ); 
    // }
    // // Navigate to Calendar when clicked
    // void openCalendarScreen(){
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => CalendarScreen())
    //   ); 
    // }

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.green,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.air)),
            label: 'Mindfulness Exercises',
          ),
          NavigationDestination(
            icon: Icon(Icons.info),
            label: 'Stress Reduction Techniques',
          ),
          NavigationDestination(
            icon: Icon(Icons.arrow_back),
            label: 'Exit'
          ),
        ],
      ),
      body: <Widget>[

        // Home Screen / Daily Affirmations
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                dailyAffirmation,
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),

        // Exercises
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.tips_and_updates),
                  title: Text('4-7-8 Breathing'),
                  subtitle: Text('Inhale for 4 seconds.\nHold for 7 seconds.\nExhale for 8 seconds.'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.tips_and_updates),
                  title: Text('Box Breathing'),
                  subtitle: Text('Inhale for 4s, Hold for 4s. \nExhale for 4s, Hold for 4s'),
                ),
              ),
            ],
          ),
        ),    

        // Techniques
        ListView.builder(
          reverse: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Excercise',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            if (index == 1){
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Deep Breathing',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
            }
            if (index == 2){
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Listen to Music',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
            }
            if (index == 3){
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Get Enough Sleep',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
            }
            if (index == 4){
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Meditation',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
            }
          },
        ),
        // Calendar
        // Exit Back
        Center(
          child: FloatingActionButton(
            onPressed: (){
              Navigator.of(context).pop();
            //Navigator.pop(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: const Text('Back to Entry'),
          ),
        ),
      ][currentPageIndex]
    );
  }

}