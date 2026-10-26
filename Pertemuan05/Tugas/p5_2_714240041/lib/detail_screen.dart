import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String nama;
  final String npm;

  const DetailScreen({
    super.key,
    required this.nama,
    required this.npm,
  });

  @override
  Widget build(BuildContext context) {
    const gambarAktivitas = [
      'images/activity_1.jpg',
      'images/activity_2.jpg',
      'images/activity_3.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Profil'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            nama,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'NPM: $npm',
            style: const TextStyle(fontFamily: 'Poppins'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Halo! Kenalin aku Raditya, Mahasigma Teknik Informatika yang Baik, Soft Spoken, Ramah, Rajin Menabung',
          ),
          const SizedBox(height: 24),
          const Text(
            'Activity',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: gambarAktivitas.map((path) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      path,
                      width: 190,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }
}