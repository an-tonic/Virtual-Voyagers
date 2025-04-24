import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'HomePage.dart';

class ScavengerHuntPage extends StatefulWidget {
  const ScavengerHuntPage({super.key, required this.adventure});

  final Adventure adventure;

  @override
  State<ScavengerHuntPage> createState() => _ScavengerHuntPageState();
}

class _ScavengerHuntPageState extends State<ScavengerHuntPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.adventure.name),
      ),
      body: Stack(
        children: [
          // Replace this with your static map image
          InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(0.0),
            child: Image.asset(
              'assets/map_placeholder.png',
              fit: BoxFit.contain, // Use BoxFit.contain to see the whole image initially
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.add_task, color: Colors.redAccent),
                      Text('${widget.adventure.progress}/${widget.adventure.length}', style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: () async {
                      final String address = widget.adventure.google_point;
                      final Uri googleMapsUrl = Uri.parse(address);
                      if (await canLaunchUrl(googleMapsUrl)) {
                        await launchUrl(googleMapsUrl);
                      }
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.redAccent),
                        const SizedBox(width: 8.0),
                        Text(widget.adventure.address, style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text('Quest X', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('Multiple Choice'),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Go back
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Back'),
                      ),
                      ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}