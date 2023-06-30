import 'package:flutter/material.dart';
import 'package:sleeping_beauty/create_new_scene.dart';
class Scenes extends StatefulWidget {
  @override
  State<Scenes> createState() => _ScenesState();
}
class _ScenesState extends State<Scenes> {
  final List<Scene> favoriteScenes = [
    Scene(name: 'Favorite Scene 1', artwork: 'images/c1.jpg'),
    Scene(name: 'Favorite Scene 2', artwork: 'images/c1.jpg'),
    Scene(name: 'Favorite Scene 3', artwork: 'images/c1.jpg'),
  ];

  final List<Scene> recommendedScenes = [
    Scene(name: 'Recommended Scene 1', artwork: 'images/c2.jpg'),
    Scene(name: 'Recommended Scene 2', artwork: 'images/c2.jpg'),
    Scene(name: 'Recommended Scene 3', artwork: 'images/c2.jpg'),
  ];
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
          title: Text('Browse Scenes Screen'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Favorite Scenes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: favoriteScenes.length,
                itemBuilder: (context, index) {
                  final scene = favoriteScenes[index];
                  return ListTile(
                    leading: Image.asset(
                      scene.artwork,
                      width: 60,
                      height: 60,
                    ),
                    title: Text(scene.name),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Recommended Scenes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: recommendedScenes.length,
                itemBuilder: (context, index) {
                  final scene = recommendedScenes[index];
                  return ListTile(
                    leading: Image.asset(
                      scene.artwork,
                      width: 60,
                      height: 60,
                    ),
                    title: Text(scene.name),
                  );
                },
              ),
            ),
            Container(
              child: Material(
                borderRadius: BorderRadius.circular(5.0),
                child: MaterialButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewScene()));
                },
                  textColor: Colors.brown.shade600,
                  color: Colors.grey.shade300,
                  elevation: 5.0,
                  child: Text('Create New Scene'),),
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Scene {
  final String name;
  final String artwork;

  Scene({required this.name, required this.artwork});
}