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
  

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
            icon: Badge(child: Icon(Icons.chat_bubble_rounded)),
            label: 'Mindfulness',
          ),
          NavigationDestination(
            icon: Icon(Icons.contact_emergency_outlined),
            label: 'Stress Reduction',
          ),
          NavigationDestination(
            icon: Icon(Icons.arrow_back),
            label: 'Exit'
          ),
        ],
      ),
      body: <Widget>[

        // Home Screen
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Home page',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),

        // Exercises
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),        
        // Techniques
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
          },
        ),
        // Calendar
        // Exit Back
        FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pop();
          //Navigator.pop(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          child: const Text('Back to Entry'),
        ),

      ][currentPageIndex]
      // appBar: AppBar(
      //   title: const Text('HomeScreen Mindfulness'),
      // ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[

      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           ElevatedButton(
      //             onPressed: (){
      //               setState(){
      //                 openMindfulnessScreen();
      //               };
      //             },
      //             child: const Text('Mindfulness Screen'),
      //           ),
      //           ElevatedButton(
      //             onPressed: (){
      //               setState(){
      //                 openStressReduceScreen();
      //               };
      //             },
      //             child: const Text('Stress Reduction Screen'),
      //           ),
      //         ],
      //       ),

      //       ElevatedButton(
      //         onPressed: (){
      //           setState(){
      //             openCalendarScreen();
      //           };
      //         },
      //         child: const Text('Calendar Screen'),
      //       ),


    );
  }

}