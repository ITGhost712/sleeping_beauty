import 'package:flutter/material.dart';
class SceneNamingScreen extends StatefulWidget {
  @override
  _SceneNamingScreenState createState() => _SceneNamingScreenState();
}

class _SceneNamingScreenState extends State<SceneNamingScreen> {
  bool isFavorite = false;
  bool isPinned = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.brown.shade300,
          title: Text('Save Scene Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name the Scene',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                  SizedBox(width: 16.0),
                  IconButton(
                    icon: Icon(
                      isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                      color: isPinned ? Colors.blue : null,
                    ),
                    onPressed: () {
                      setState(() {
                        isPinned = !isPinned;
                      });
                    },
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown.shade300,
                    ),
                    onPressed: () {
                      // Save the scene
                    },
                    child: Text('Save Scene'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}