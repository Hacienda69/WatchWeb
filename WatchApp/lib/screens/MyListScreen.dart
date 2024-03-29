import 'dart:ui';

import 'package:WatchApp/main.dart';
import 'package:WatchApp/screens/widgets/mediaWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:WatchApp/screens/mainmenu.dart';
import 'package:WatchApp/models/APImovies.dart';
import 'package:WatchApp/models/APIseries.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var savedMedia = Provider.of<SavedMediaModel>(context);
    List<Movies> savedMovies = savedMedia.savedMovies;
    List<Series> savedSeries = savedMedia.savedSeries;

    Color backGroundColor = const Color.fromARGB(255, 17, 17, 17);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          shadowColor: Colors.black,
          elevation: 10,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                "My List",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        backgroundColor: backGroundColor,
        body: Column(
          children: [
            const MediaTypeTitle(title: "Saved Movies"),
            Expanded(
              child: ListView.builder(
                itemCount: savedMovies.length,
                itemBuilder: (context, index) {
                  return MediaItemReduced(media: savedMovies[index]);
                }
              ),
            ),
            const MediaTypeTitle(title: "Saved Series"),
            Expanded(
              child: ListView.builder(
                itemCount: savedSeries.length,
                itemBuilder: (context, index) {
                  return MediaItemReduced(media: savedSeries[index]);
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
