import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:virtual_voyagers/ScavengerHunt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Adventure> currentAdventures = <Adventure>[
    Adventure(
      'Frozen Adventure',
      3,
      5,
      "Spyrou Kyprianou 55, Pano Platres",
      "https://maps.app.goo.gl/V2KHK6wAYqjhqzjE6",
      "assets/images/3.2.jpeg",
    ),
    Adventure(
      'Lost Artifact Adventure',
      4,
      10,
      "987 Larnaca, Cyprus",
      "https://maps.app.goo.gl/V2KHK6wAYqjhqzjE6",
      "assets/images/2.jpg",
    ),
  ];

  final List<Adventure> otherAdventures = <Adventure>[
    Adventure.name('Echoing Depths Adventure', "assets/images/3.3.jpg"),
  ];

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10.0),
              color: Theme
                  .of(context)
                  .primaryColor,
              child: Container(
                width: 390,
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Text(
                  "Hello! Ready for adventure?",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10.0),
              color: Theme
                  .of(context)
                  .primaryColor,
              child: Container(
                width: 390,
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Text(
                  "Total points: 5000",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Divider(thickness: 2, color: Colors.grey[200]),
            Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                "Current Adventures",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: currentAdventures.length,
                itemBuilder: (BuildContext context, int index) {
                  return AdventureCard(adventure: currentAdventures[index]);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                "Other Adventures",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: otherAdventures.length,
                itemBuilder: (BuildContext context, int index) {
                  return AdventureCard(adventure: otherAdventures[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Adventure {
  String name;
  int length = 10;
  int progress = 0;
  String address = "";
  String google_point = "";
  String image_path = "";

  Adventure(this.name,
      this.progress,
      this.length,
      this.address,
      this.google_point,
      this.image_path,);

  Adventure.name(this.name, this.image_path);

  double percent() {
    return progress / length;
  }
}

class AdventureCard extends StatelessWidget {
  const AdventureCard({super.key, required this.adventure});

  final Adventure adventure;

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScavengerHuntPage(adventure: adventure),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3,
        color: Theme
            .of(context)
            .primaryColor,
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(image: AssetImage(adventure.image_path)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 190,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      adventure.name,
                      style: Theme
                          .of(
                        context,
                      )
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  Row(
                    children: [
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 14.0,
                        percent: adventure.percent(),
                        backgroundColor: Colors.white,
                        progressColor: Color(0xFF0066FF),
                      ),
                      Text(
                        "${adventure.progress}/${adventure.length}",
                        style: Theme
                            .of(
                          context,
                        )
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.play_circle,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
