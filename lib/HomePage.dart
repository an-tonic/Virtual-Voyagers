import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> currentAdventures = <String>[
    'Adventure A',
    'Adventure B',
    'Adventure C',
  ];

  final List<String> otherAdventures = <String>[
    'Adventure D',
    'Adventure E',
    'Adventure F',
  ];

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Text("Hello! Ready for adventure?"),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text("Total points: 5000"),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text("Current adventures"),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: currentAdventures.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 50,
                    child: Center(
                      child: Row(
                        children: [
                          Text(currentAdventures[index]),
                          IconButton(
                            onPressed: onPressed,
                            icon: Icon(Icons.play_arrow_rounded),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text("Other adventures"),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: otherAdventures.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 50,
                    child: Center(
                      child: Row(
                        children: [
                          Text(otherAdventures[index]),
                          IconButton(
                            onPressed: onPressed,
                            icon: Icon(Icons.play_arrow_rounded),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
