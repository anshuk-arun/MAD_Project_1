import 'package:flutter/material.dart';
import 'package:madp1_mindfulness/HomeScreen.dart';

// void main(){
//   runApp(const MindfulApp());
// }

class MindfulApp extends StatelessWidget {
  const MindfulApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData swatchColor = ThemeData(
      primarySwatch: Colors.green,
      useMaterial3: true,
    );

    return MaterialApp(
      title: "Mindful App",
      theme: swatchColor,
      home: const EntryScreen(title: 'Entry Screen'),
    );
  }
}

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key, required this.title});
  final String title;

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {

  // debug, to show button works. just initial, it'll go away later.
  int count = 0;
  @override
  Widget build(BuildContext context) {

    // Navigate to HomeScreen when clicked
    void openHomeScreen(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(title: ''))
      ); 
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'G1_Madp1_Mindfulness App : count $count',
            ),
            const Text(
              'This is EntryScreen'
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  count += 1;
                });
              },
              onLongPress: (){
                setState(() {  
                  openHomeScreen();
                });
              },
              child: const Text('Short Press Counter | Long Press HomeScreen'),
            ),
          ],
        ),
      ),
      
    );
  }
}
