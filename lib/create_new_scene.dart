import 'package:flutter/material.dart';
import 'package:sleeping_beauty/browse_audio.dart';
import 'package:sleeping_beauty/save_scene.dart';
class NewScene extends StatefulWidget {
  @override
  State<NewScene> createState() => _NewSceneState();
}
enum SliderType { Static, Dynamic }
class _NewSceneState extends State<NewScene> {
  SliderType _sliderType = SliderType.Static;
  double _startingTintLevel = 0.0;
  double _endingTintLevel = 0.0;
  double _transitionPeriod = 0.0;
  int Hours=1;
  int mins=30;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.brown, // Set radio button color to purple
        //accentColor: Colors.purple, // Set slider color to brown
    ),
        ),
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
    title: Text('Create New Scene Screen'),
    ),
    body: SingleChildScrollView(
      child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.brown.shade300, // Set the button color to brown
        ),
      onPressed: () {
      // Handle button tap to add image
      print('Add Image button tapped');
      },
      child: Text('Add Image'),
      ),
      SizedBox(height: 16.0),
      Text('Slider Type:'),
      Row(
      children: [
      Radio<SliderType>(
        activeColor: Colors.purple,
      value: SliderType.Static,
      groupValue: _sliderType,
      onChanged: (SliderType? value) {
      setState(() {
      _sliderType = value!;
      });
      },
      ),
      Text('Static'),
      SizedBox(width: 16.0),
      Radio<SliderType>(
        activeColor: Colors.purple,
      value: SliderType.Dynamic,
      groupValue: _sliderType,
      onChanged: (SliderType? value) {
      setState(() {
      _sliderType = value!;
      });
      },
      ),
      Text('Dynamic'),
      ],
      ),
      if (_sliderType == SliderType.Static)
      Slider(
      value: _startingTintLevel,
      min: 0,
      max: 100,
      onChanged: (value) {
      setState(() {
      _startingTintLevel = value;
      });
      },
      label: 'Tint Level',
      semanticFormatterCallback: (value) => value.toInt().toString(),
      ),
      if (_sliderType == SliderType.Dynamic)
      Column(
      children: [
        Text('Starting Tint Level',
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: Colors.brown.shade500,
        ),),
      Slider(
      value: _startingTintLevel,
      min: 0,
      max: 100,
      onChanged: (value) {
      setState(() {
      _startingTintLevel = value;
      });
      },
      label: 'Starting Tint Level',
      semanticFormatterCallback: (value) => value.toInt().toString(),
      ),
        Text('Ending Tint Level',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.brown.shade500,
          ),),
      Slider(
      value: _endingTintLevel,
      min: 0,
      max: 100,
      onChanged: (value) {
      setState(() {
      _endingTintLevel = value;
      });
      },
      label: 'Ending Tint Level',
      semanticFormatterCallback: (value) => value.toInt().toString(),
      ),
        Text('Transition Period',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.brown.shade500,
          ),),
      Slider(
      value: _transitionPeriod,
      min: 0,
      max: 10,
      onChanged: (value) {
      setState(() {
      _transitionPeriod = value;
      });
      },
      label: 'Transition Period',
      semanticFormatterCallback: (value) => value.toInt().toString(),
      ),
        //Text('Hold selected ending tint level for ${_transitionPeriod.toStringAsFixed(1)} seconds.'),
        Text('Hold selected ending tint level for',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.brown.shade500,
          ),),
        Container(
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Center(child: Text('Hours', style: TextStyle(
      fontSize: 18.0, color: Colors.brown.shade500,
      ),
      ),
      ),
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
      Text(Hours.toString(), style: TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.w900,
        color: Colors.brown.shade500,
      ),
      ),
      ],
      ),
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      FloatingActionButton(onPressed: (){
      setState((){
        if(Hours>0)
      Hours--;
      });
      },
      heroTag: null,
      child: Icon(Icons.arrow_downward_outlined, color: Colors.white,),
      backgroundColor: Colors.brown.shade500,
      ),
      SizedBox(
      width: 10.0,
      ),
      FloatingActionButton(onPressed: (){
      setState((){
      Hours++;
      });
      },
      heroTag: null,
      child: Icon(Icons.arrow_upward_outlined, color: Colors.white,),
      backgroundColor: Colors.brown.shade500,
      ),
      ],
      ),
      ],
      ),
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text('Minutes', style: TextStyle(
                fontSize: 18.0, color: Colors.brown.shade500,
              ),
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(mins.toString(), style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Colors.brown.shade500,
                  ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(onPressed: (){
                    setState((){
                      if(mins>0)
                        mins--;
                    });
                  },
                    heroTag: null,
                    child: Icon(Icons.arrow_downward_outlined, color: Colors.white,),
                    backgroundColor: Colors.brown.shade500,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  FloatingActionButton(onPressed: (){
                    setState((){
                      mins++;
                    });
                  },
                    heroTag: null,
                    child: Icon(Icons.arrow_upward_outlined, color: Colors.white,),
                    backgroundColor: Colors.brown.shade500,
                  ),
                ],
              ),
            ],
          ),
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ],
      ),
    Container(
    padding: EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Recently Played Tracks',
    style: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 16.0),
    TrackItem(
    title: 'Track 1',
    artist: 'Artist 1',
    thumbnail: 'images/c1.jpg',
    ),
    SizedBox(height: 16.0),
    TrackItem(
    title: 'Track 2',
    artist: 'Artist 2',
    thumbnail: 'images/c1.jpg',
    ),
    SizedBox(height: 16.0),
    TrackItem(
    title: 'Track 3',
    artist: 'Artist 3',
    thumbnail: 'images/c1.jpg',
    ),
    SizedBox(height: 16.0),
    TrackItem(
    title: 'Track 4',
    artist: 'Artist 4',
    thumbnail: 'images/c1.jpg',
    ),
    SizedBox(height: 16.0),
    TrackItem(
    title: 'Track 5',
    artist: 'Artist 5',
    thumbnail: 'images/c1.jpg',
    ),
    ],
    ),
    ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.brown.shade300, // Set the button color to brown
          ),
          onPressed: () {
            // Handle button tap to add image
            //print('Add Image button tapped');
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BrowseAudio()));
          },
          child: Text('Browse Audio'),
        ),
        SizedBox(height: 10.0,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.brown.shade300, // Set the button color to brown
          ),
          onPressed: () {
            // Handle button tap to add image
            //print('Add Image button tapped');
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SceneNamingScreen()));
          },
          child: Text('Save Scene'),
        ),
      ],
      ),
      ),
    ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
class TrackItem extends StatelessWidget {
  final String title;
  final String artist;
  final String thumbnail;

  const TrackItem({
    required this.title,
    required this.artist,
    required this.thumbnail,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          thumbnail,
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(artist),
          ],
        ),
      ],
    );
  }
}
