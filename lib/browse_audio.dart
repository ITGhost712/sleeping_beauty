import 'package:flutter/material.dart';
import 'package:sleeping_beauty/create_new_scene.dart';
class BrowseAudio extends StatelessWidget {
  final List<AudioItem> audioItems = [
    AudioItem(
      title: 'Apple Music',
      icon: Icons.music_note,
    ),
    AudioItem(
      title: 'Pandora',
      icon: Icons.radio,
    ),
    AudioItem(
      title: 'Spotify',
      icon: Icons.music_note,
    ),
    AudioItem(
      title: 'SiriusXM',
      icon: Icons.radio,
    ),
    AudioItem(
      title: 'Sleeping Beauty Curation Items',
      icon: Icons.music_note,
    ),
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
    title: Text('Browse Audio Screen'),
    ),
          body: ListView.builder(
            itemCount: audioItems.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(audioItems[index].icon),
                title: Text(audioItems[index].title),
                onTap: () {
                  // Navigate to a new screen or perform any action
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewScene()));
                },
              );
            },
          ),
    ),
      debugShowCheckedModeBanner: false,
    );
  }
}
class AudioItem {
  final String title;
  final IconData icon;

  AudioItem({required this.title, required this.icon});
}
