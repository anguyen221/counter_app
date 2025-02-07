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

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int counter = 0;
  bool isFirstImage = true;
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );
    controller.forward();
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void toggleImage() {
    setState(() {
      isFirstImage = !isFirstImage;
    });
    controller.reset();
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
            FadeTransition(
              opacity: curvedAnimation,
              child: Image.asset(
                isFirstImage ? 'images/testimage.png' : 'images/testimage1.png',
                key: ValueKey<bool>(isFirstImage),
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: toggleImage,
              child: Text('Toggle Image'),
            ),
          ],
        ),
      ),
    );
  }
}
