import 'package:flutter/material.dart';
import 'package:p4_1_714240041/tourism_place.dart';

var iniFontCustom = const TextStyle(fontFamily: 'GoogleSansFlex');

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 4/3,
                  child: Image.asset(
                    place.imageAsset,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
      
                Positioned(
                  top: 10,
                  left: 10,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'GoogleSansFlex',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.calendar_today, color: Colors.red),
                          SizedBox(height: 8.0),
                          Text(place.openDays, style: iniFontCustom),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.access_time, color: Colors.red),
                          SizedBox(height: 8.0),
                          Text(place.openTime, style: iniFontCustom),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.monetization_on, color: Colors.red),
                          SizedBox(height: 8.0),
                          Text(place.ticketPrice, style: iniFontCustom),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontFamily: 'GoogleSansFlex',
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(aspectRatio: 16/9,child: Image.network(url, fit: BoxFit.cover,)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}