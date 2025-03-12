// Import necessary Dart and Flutter packages.
import 'dart:async'; // Provides support for asynchronous programming.
import 'dart:convert'; // Allows encoding and decoding JSON data.

import 'package:flutter/material.dart'; // Flutter material design package.
import 'package:http/http.dart' as http; // HTTP package for making API requests.

// Function to fetch an album from the API.
Future<Album> fetchAlbum() async {
  // Sending an HTTP GET request to the API endpoint.
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/2'));

  if (response.statusCode == 200) {
    // If the server responds with status code 200 (OK), parse the JSON response.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server responds with an error, throw an exception.
    throw Exception('Failed to load album');
  }
}

// Data model class representing an Album.
class Album {
  final int userId; // User ID associated with the album.
  final int id; // Unique album ID.
  final String title; // Title of the album.

  // Constructor for the Album class.
  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  // Factory constructor to create an Album object from JSON data.
  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
      } =>
        Album(
          userId: userId,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

// StatefulWidget that handles API calls and UI updates.
class ApiApp extends StatefulWidget {
  const ApiApp({super.key});

  @override
  State<ApiApp> createState() => _MyAppState();
}

class _MyAppState extends State<ApiApp> {
  late Future<Album> futureAlbum; // Future to store API response.

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(); // Fetch data when the widget initializes.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example', // App title.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          // FutureBuilder listens to futureAlbum and updates UI accordingly.
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // If data is received, display the album title.
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                // If there is an error, display an error message.
                return Text('${snapshot.error}');
              }

              // If data is still loading, show a progress indicator.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
