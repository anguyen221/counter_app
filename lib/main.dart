import 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  bool isFirstImage = true;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

    void toggleImage() {
    setState(() {
      isFirstImage = !isFirstImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: incrementCounter,
              child: Text('Increment'),
            ),
            SizedBox(height: 20),
            Image.asset(
              isFirstImage ? 'images/testimage.png' : 'images/testimage1.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: toggleImage,
              child: Text('Toggle Image')
            ),
          ],
        ),
      ),
    );
  }
}