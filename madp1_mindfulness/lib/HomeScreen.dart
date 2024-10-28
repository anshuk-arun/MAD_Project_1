import 'dart:math';
import 'package:flutter/material.dart';


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

  List<String> stressTechniques = <String>[
    "Exercise",
    "Deep Breathing",
    "Listen to Music", 
    "Get Enough Sleep",
    "Meditation",
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // Daily Affirmation
    generateDailyAffirmation();


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
            if (index % 2 == 0){
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
                    stressTechniques[index],
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            if (index % 2 == 1){
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
                    stressTechniques[index],
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
          },
        ),
        
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